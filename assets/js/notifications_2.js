$(function(doc, win, $) {
    var has_focus = true;
    var notification = win.Notification || win.mozNotification || win.webkitNotification;
    var $badge = $("#notifications-badge");
    var $list = $("#notifications-list");
    var $button = $("#notifications-button");
    URL_GET_NOTIFICATION = BASE_URL + 'notify/pusher';
    URL_GET_NOTIFICATION_UPDATE = BASE_URL + 'notify/update';

    if ('undefined' === typeof notification) {
        console.log('Web notification not supported');
    } else {
        notification.requestPermission(function(permission) {});
    }

    function check_notifications(timestamp) {
        $.ajax({
            type: 'GET',
            url: URL_GET_NOTIFICATION,
            data: { timestamp : timestamp },
            dataType: 'json',
            async: true,
            success: function (data) {
                for (var i in data.notifications) {
                    notify(data.notifications[i].message, data.notifications[i].type, data.notifications[i].timestamp);
                }
                check_notifications(data.timestamp);
            }
        });
    }

    function notify(message, type, created_at) {
        var type_txt = 'info';
        var url = '#';
        var icon = 'info-circle';

        if (type == 0) {
            type_txt = 'success';
            icon = 'check';
        } else if (type == 1) {
            type_txt = 'info';
            icon = 'exclamation';
        } else if (type == 2) {
            type_txt = 'warning';
            icon = 'exclamation-triangle';
        } else if (type == 3 || type == 4) {
            type_txt = 'danger';
            icon = 'fire';
        }

        $badge.show();
        $badge.text(parseInt($badge.text()) + 1);

        $list.find(".item").eq(13).nextAll(".item").remove();
        var item = '<li class="item text-' + type_txt + '"><a href="' + url + '"><span class="text-' + type_txt + '">' +
            '<i class="fa fa-' + icon + ' fa-fw"></i> ' + message.substr(0, 22) + '</span>' +
            '<span class="pull-right text-muted small" data-time="' + created_at + '">X</span></a></li>' +
            '<li class="item divider"></li>';
        $list.prepend(item);

        $('.dropdown.open .dropdown-toggle').dropdown('toggle');

        return true;
    }

    $(win).on("blur", function () {
        has_focus = false;
    });

    $(win).on("focus", function () {
        has_focus = true;
    });

    $button.on("click", function () {
        $badge.fadeOut(300, function () {
            $badge.text(0);
        });
        
        $list.find("span[data-time]").each(function (index) {
            var $this = $(this);
            $this.text(moment.unix($this.data('time')).fromNow());
        });
    });


}(document, window, jQuery));

$('#notifications-button').on('click', function () {
    $.ajax({
        type: 'GET',
        url: URL_GET_NOTIFICATION_UPDATE,
        success: function(data){
        }
    });
});
