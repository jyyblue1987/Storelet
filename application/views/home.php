<div class="content-wrapper">
    <section class="content">
        <section class="col-lg-12 connectedSortable">
            <div id="chart_view"></div>
        </section>
    </section>
</div>
</div>
<script src="<?=base_url('assets/js/highcharts.js');?>"></script>
<script src="<?=base_url('assets/js/exporting.js');?>"></script>
<script src="<?=base_url('assets/js/graph/sales.js')?>"></script>
<script>
	$(function(doc, win, $) {
    var notification = win.Notification || win.mozNotification || win.webkitNotification;
    var $badge = $("#notifications-badge");
    var $list = $("#notifications-list");
    var $button = $("#notifications-button");
    var socket = io.connect( 'http://'+window.location.hostname+':3000' );
    URL_GET_NOTIFICATION = BASE_URL + 'notifications/getNotification';


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
            '<i class="fa fa-' + icon + ' fa-fw"></i> ' + message + '</span>'+
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

    socket.on('notification', function(data) {
        data.forEach(function (notification) {
           notify(notification.message, notification.type, notification.timestamp);
        });
    });

}(document, window, jQuery));
</script>