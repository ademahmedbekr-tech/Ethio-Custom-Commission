class NotificationManager {
    constructor() {
        this.pollingInterval = null;
        this.isDropdownOpen = false;
        this.init();
    }

    init() {
        this.setupEventListeners();
        this.startPolling();
        this.setupRealtimeConnection();
    }

    setupEventListeners() {
        // Mark as read buttons
        document.addEventListener('click', (e) => {
            if (e.target.closest('.mark-notification-read')) {
                const btn = e.target.closest('.mark-notification-read');
                const id = btn.dataset.id;
                this.markAsRead(id);
            }

            if (e.target.closest('.delete-notification')) {
                const btn = e.target.closest('.delete-notification');
                const id = btn.dataset.id;
                this.deleteNotification(id);
            }

            if (e.target.closest('#markAllNotificationsRead')) {
                this.markAllAsRead();
            }
        });

        // Track dropdown state
        const dropdown = document.querySelector('.dropdown-notifications');
        if (dropdown) {
            dropdown.addEventListener('show.bs.dropdown', () => {
                this.isDropdownOpen = true;
                this.loadLatestNotifications();
            });

            dropdown.addEventListener('hide.bs.dropdown', () => {
                this.isDropdownOpen = false;
            });
        }
    }

    startPolling() {
        // Poll every 10 seconds for new notifications
        this.pollingInterval = setInterval(() => {
            this.checkNewNotifications();
        }, 10000);
    }

    checkNewNotifications() {
        fetch('/notifications/unread-count')
            .then(response => response.json())
            .then(data => {
                const currentCount = parseInt(document.getElementById('newNotificationCount')?.innerText || '0');
                if (data.count > currentCount) {
                    // New notifications arrived
                    this.playNotificationSound();
                    this.showToast('New notification!', 'You have new notifications');

                    if (this.isDropdownOpen) {
                        this.loadLatestNotifications();
                    } else {
                        this.updateBadgeOnly(data.count);
                    }
                } else {
                    this.updateBadgeOnly(data.count);
                }
            })
            .catch(error => console.error('Error:', error));
    }

    loadLatestNotifications() {
        fetch('/notifications/latest')
            .then(response => response.json())
            .then(data => {
                this.renderNotifications(data.notifications);
                this.updateBadge(data.unread_count);
            })
            .catch(error => console.error('Error:', error));
    }

    renderNotifications(notifications) {
        const container = document.getElementById('notificationsList');
        if (!container) return;

        if (notifications.length === 0) {
            container.innerHTML = `
                <li class="text-center py-4" id="noNotificationsMessage">
                    <i class="icon-base bx bx-bell-off" style="font-size: 48px;"></i>
                    <p class="mt-2 mb-0">No notifications yet</p>
                </li>
            `;
            return;
        }

        let html = '';
        notifications.forEach(notification => {
            const isRead = notification.is_read;
            const data = notification.data;

            html += `
                <li class="list-group-item list-group-item-action dropdown-notifications-item ${isRead ? 'marked-as-read' : ''}"
                    data-notification-id="${notification.id}">
                    <div class="d-flex">
                        <div class="flex-shrink-0 me-3">
                            <div class="avatar">
                                <span class="avatar-initial rounded-circle bg-label-${data.color || 'primary'}">
                                    <i class="icon-base ${data.icon || 'bx bx-bell'}"></i>
                                </span>
                            </div>
                        </div>
                        <div class="flex-grow-1">
                            <h6 class="small mb-0">${this.escapeHtml(data.title)}</h6>
                            <small class="mb-1 d-block text-body">${this.escapeHtml(data.message)}</small>
                            <small class="text-body-secondary">${notification.created_at}</small>
                        </div>
                        <div class="flex-shrink-0 dropdown-notifications-actions">
                            ${!isRead ? `
                                <a href="javascript:void(0)" class="dropdown-notifications-read mark-notification-read" data-id="${notification.id}">
                                    <span class="badge badge-dot"></span>
                                </a>
                            ` : ''}
                            <a href="javascript:void(0)" class="dropdown-notifications-archive delete-notification" data-id="${notification.id}">
                                <span class="icon-base bx bx-x"></span>
                            </a>
                        </div>
                    </div>
                </li>
            `;
        });

        container.innerHTML = html;
    }

    markAsRead(notificationId) {
        fetch(`/notifications/${notificationId}/mark-as-read`, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
                'X-CSRF-TOKEN': document.querySelector('meta[name="csrf-token"]').content
            }
        })
        .then(response => response.json())
        .then(data => {
            if (data.success) {
                // Update UI
                const item = document.querySelector(`.dropdown-notifications-item[data-notification-id="${notificationId}"]`);
                if (item) {
                    item.classList.add('marked-as-read');
                    const markBtn = item.querySelector('.mark-notification-read');
                    if (markBtn) markBtn.remove();
                }
                this.updateUnreadCount();
                this.showToast('Success', 'Notification marked as read', 'success');
            }
        });
    }

    markAllAsRead() {
        fetch('/notifications/mark-all-read', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
                'X-CSRF-TOKEN': document.querySelector('meta[name="csrf-token"]').content
            }
        })
        .then(response => response.json())
        .then(data => {
            if (data.success) {
                document.querySelectorAll('.dropdown-notifications-item:not(.marked-as-read)').forEach(item => {
                    item.classList.add('marked-as-read');
                    const markBtn = item.querySelector('.mark-notification-read');
                    if (markBtn) markBtn.remove();
                });
                this.updateBadge(0);
                this.updateNewCount(0);
                this.showToast('Success', 'All notifications marked as read', 'success');
            }
        });
    }

    deleteNotification(notificationId) {
        if (!confirm('Delete this notification?')) return;

        fetch(`/notifications/${notificationId}`, {
            method: 'DELETE',
            headers: {
                'Content-Type': 'application/json',
                'X-CSRF-TOKEN': document.querySelector('meta[name="csrf-token"]').content
            }
        })
        .then(response => response.json())
        .then(data => {
            if (data.success) {
                const item = document.querySelector(`.dropdown-notifications-item[data-notification-id="${notificationId}"]`);
                if (item) item.remove();
                this.updateUnreadCount();
                this.showToast('Success', 'Notification deleted', 'success');
            }
        });
    }

    updateBadge(count) {
        const badge = document.getElementById('notificationBadge');
        const newCountSpan = document.getElementById('newNotificationCount');

        if (badge) {
            if (count > 0) {
                badge.classList.remove('d-none');
            } else {
                badge.classList.add('d-none');
            }
        }

        if (newCountSpan) {
            newCountSpan.innerText = `${count} New`;
            if (count === 0) {
                newCountSpan.classList.add('d-none');
            } else {
                newCountSpan.classList.remove('d-none');
            }
        }
    }

    updateUnreadCount() {
        fetch('/notifications/unread-count')
            .then(response => response.json())
            .then(data => {
                this.updateBadge(data.count);
                this.updateNewCount(data.count);
            });
    }

    updateNewCount(count) {
        const newCountSpan = document.getElementById('newNotificationCount');
        if (newCountSpan) {
            newCountSpan.innerText = `${count} New`;
            if (count === 0) {
                newCountSpan.classList.add('d-none');
            } else {
                newCountSpan.classList.remove('d-none');
            }
        }
    }

    setupRealtimeConnection() {
        // If you want to add WebSocket/SSE later, add it here
        if (window.EventSource) {
            this.setupSSE();
        }
    }

    setupSSE() {
        // Optional: Implement Server-Sent Events for real-time
        const eventSource = new EventSource('/notifications/stream');
        eventSource.onmessage = (event) => {
            const notification = JSON.parse(event.data);
            this.showToast(notification.title, notification.message);
            this.loadLatestNotifications();
            this.playNotificationSound();
        };
    }

    showToast(title, message, type = 'info') {
        // Create toast container if doesn't exist
        let toastContainer = document.querySelector('.toast-container');
        if (!toastContainer) {
            toastContainer = document.createElement('div');
            toastContainer.className = 'toast-container position-fixed bottom-0 end-0 p-3';
            document.body.appendChild(toastContainer);
        }

        const toastId = 'toast-' + Date.now();
        const toastHTML = `
            <div id="${toastId}" class="toast" role="alert" aria-live="assertive" aria-atomic="true" data-bs-autohide="true" data-bs-delay="5000">
                <div class="toast-header">
                    <i class="icon-base bx bx-bell me-2"></i>
                    <strong class="me-auto">${this.escapeHtml(title)}</strong>
                    <small>just now</small>
                    <button type="button" class="btn-close" data-bs-dismiss="toast"></button>
                </div>
                <div class="toast-body">
                    ${this.escapeHtml(message)}
                </div>
            </div>
        `;

        toastContainer.insertAdjacentHTML('beforeend', toastHTML);
        const toastElement = document.getElementById(toastId);
        const toast = new bootstrap.Toast(toastElement);
        toast.show();

        // Remove from DOM after hidden
        toastElement.addEventListener('hidden.bs.toast', () => {
            toastElement.remove();
        });
    }

    playNotificationSound() {
        // Optional: Play sound
        try {
            const audio = new Audio('/sounds/notification.mp3');
            audio.play().catch(e => console.log('Audio play failed'));
        } catch(e) {
            console.log('Sound not supported');
        }
    }

    escapeHtml(text) {
        const div = document.createElement('div');
        div.textContent = text;
        return div.innerHTML;
    }
}

// Initialize when DOM is ready
document.addEventListener('DOMContentLoaded', () => {
    window.notificationManager = new NotificationManager();
});
