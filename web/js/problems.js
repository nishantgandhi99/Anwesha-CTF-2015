$().ready(function () {
    $('#done').popover('show');
});
$('#done').on('shown.bs.popover', function () {
    window.setTimeout(function () {
        $('#done').popover('destroy');
    }, 2000);
});
