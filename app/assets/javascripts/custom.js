$(document).ready(function() {
    $('.tokenize').tokenfield();
    timeslotize($('.time-board'));
    $('[data-toggle="tooltip"]').tooltip();
    $('input[type="date"]').tooltip({'trigger':'hover focus', 'html': 'true', 'title': 'For Safari and IE user <br />Date Format: YYYY-MM-DD'});
});