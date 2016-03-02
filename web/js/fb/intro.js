$(document).ready(function(){
    selects.init();
  
});


selects = {
    sel: '.awesome-select',
    init: function () {
        var self = this;

        $(self.sel).on('change focus blur keyup', '.real-select', function () {
            var $trigger = $(this),
                label = $trigger.find('option:selected').text(),
                $target = $trigger.parent().find($trigger.data('target'));

            $target.text(label);
        }).find('.real-select').on('focus blur', function () {
            $(this).closest(self.sel).toggleClass('focus');
        });
    }
};




