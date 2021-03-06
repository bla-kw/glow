$(function () {
    var $b = $("body");

    // allgemeines Zeug
    /*window.setTimeout( function ()
    {
        $( "img" ).unveil();
    }, 500 );*/
    $("img").unveil(50,function() {
        $.fn.matchHeight._update();
    });
    $('.hasTooltip').tooltip({container: 'body'});
    $('.hasPopover').popover();
    $('.ajax').fancybox({type: 'ajax'});

    // navs menüs etc
    $('[data-toggle="offcanvas"]').click(function () {
        $('.row-offcanvas').toggleClass('active');
    });


    //          _               _               _
    //      ___| |__   ___  ___| | _____  _   _| |_
    //     / __| '_ \ / _ \/ __| |/ / _ \| | | | __|
    //    | (__| | | |  __/ (__|   < (_) | |_| | |_
    //     \___|_| |_|\___|\___|_|\_\___/ \__,_|\__|

    $b.on("change", "#blshowshipaddress", function () {
        if (this.checked) $("#shippingAddress").fadeOut('fast');
        else $("#shippingAddress").fadeIn('slow');
    });

    // Schritt 1 ----------------------------------------------------------------- Schritt 1
    var submitTimeout;
    $b.on("change", "input[name^='aproducts'][id^='amount_']", function () {
        if (typeof submitTimeout !== 'undefined') window.clearTimeout(submitTimeout);
        submitTimeout = window.setTimeout(function (input) {
            input.blur();
        }, 5000, $(this));
    })
        .on("focusout", "input[name^='aproducts'][id^='amount_']", function () {
            if ($(this).val() != $(this).data("value")) $(this).parents("form").submit();
        });
    // Schritt 2 ----------------------------------------------------------------- Schritt 2
    $b.on("change", "input[name='oxaddressid']", function () {
        var selectValue = $(this).val();

        // was ist das für ein Quatsch? Nirgends wird geprüft ob realoadaddress == 1 oder 2 ist
        if ($("input[name=reloadaddress]")) $("input[name=reloadaddress]").val((selectValue === '-1' ? 1 : 2));

        if (selectValue !== '-1') // andere ausgewählte Adresse lasen
        {
            var address = aShipAddr[selectValue];
            for (var field in address) {
                if (address.hasOwnProperty(field)) {
                    $("input[type='text'][id='deladr_" + field + "']").val(address[field]); // text fields
                    $("input[id^='deladr_" + field + "'][value='" + address[field] + "'").prop("checked", true); // radio + options
                    $("select[id^='deladr_" + field + "'] option[value='" + address[field] + "'").prop("selected", true); // radio + options
                }
            }
            //$("form[name='order']").unbind('submit');
            //$('#shippingAddressForm').remove();
            //$("form[name='order'] input[name=cl]").val($("input[name=changeClass]").val());
            //$("form[name='order'] input[name=fnc]").val("");
            //$("form[name='order']").submit();
        }
        else // neue Adresse eingeben
        {
            $("input[type='text'][id^='deladr']").val(""); // textfelder
            $("input[id^='deladr']:checked").prop("checked", null); // radio
            $("select[id^='deladr'] option:selected").prop("selected", null); // option
            $('#shippingAddressForm').show();
        }
    });

    // Schritt 3 ----------------------------------------------------------------- Schritt 3
    $b.on("change", "input[name='sShipSet']", function () {
        $(this).parent("form").submit();
    });

    $(".validate").bootstrapValidator({
        framework: 'bootstrap',
        /* feedbackIcons: {
         valid: 'fa fa-check',
         invalid: 'fa fa-times',
         validating: 'fa fa-spinner fa-pulse'
         },*/
        fields: {
            lgn_usr: {
                validators: {
                    notEmpty: {
                        message: 'Bitte geben Sie Ihre E-Mail Adresse ein!'
                    }/*,
                    regexp: {
                        regexp: /^[]\d{5}$/, // TODO: PW Stärke validieren
                        message: 'Das PAsswort muss mindestens einen Buchstaben enthalten'
                    }*/
                }
            },
            lgn_pwd: {
                validators: {
                    notEmpty: {
                        message: 'Bitte geben Sie ein Passwort ein!'
                    }
                }
            },
            lgn_pwd2: {
                validators: {
                    identical: {
                        field: 'lgn_pwd',
                        message: 'Die Passwörter müssen übereinstimmen!'
                    }
                }
            },
            c_mac: {
                validators: {
                    identical: {
                        field: 'c_text',
                        message: 'Ihre Eingabe entspricht nicht dem Prüfcode'
                    }
                }
            }

        }
    });
});