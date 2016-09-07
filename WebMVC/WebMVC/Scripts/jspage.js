﻿

        


var loadTB = function (result) {
    console.log(result)
    if (result.error == -1) {
        console.log("Chua dang nhap")
        thongbao2s("Thông báo", "Vui lòng đăng nhập")
    } else {
        //thongbaosuccess2s("Thông báo", "Thành công !")
        $.ajax({
            url: "/FTeam/UpdateToCart",
            type: "GET",
            success: function (result) {
                $('#li-cart').html(result);
            }
        });
    }
}

var loadTBD = function (result) {
    console.log(result)
    if (result.error == -1) {
        console.log("Chua dang nhap")
        thongbao2s("Thông báo", "Gửi không thành công")
    } else {
        thongbaosuccess2s("Thông báo", "Gửi thành công !")
    }
}

var loadC = function (result) {
    console.log(result)
    
    //$('.rating-box div').raty();
    //$('.rating-box div').raty({ score: 5 });

    //$('.rating-box div').raty('readOnly', true);
    //$(".owl-carousel").owlCarousel();
    //$('#container').perfectScrollbar();
    quickViewModal($('a.product-hover'));
    selectBox();
    singleProduct();

    $('.tabs').each(function () {

        var tab = $(this);
        tab.find('.tab-content > div').hide();
        tab.find('.tab-heading>a:first-child').addClass('active');
        tab.find('.tab-content > div:first-child').show();

        var tabMenuItems = tab.find('.tab-heading>a');
        tabMenuItems.click(function (e) {

            e.preventDefault();

            var target = $(this).attr('href');

            tab.find('.tab-content > div').hide();
            tab.find('.tab-heading>a').removeClass('active');

            $(this).addClass('active');
            tab.find(target).show();

        });

    });





    /* Twitter WIdget */
    $('#twitter-widget').tweet({
        modpath: 'twitter/',
        count: 2,
        loading_text: 'loading twitter feed...',
    })




    /* Tooltips */
    $('.tooltip-hover').tooltip();




    // TinyNav.js 1
    $('#main-navigation>ul').tinyNav({
        active: 'current-item',
        header: 'Navigation',
        indent: '→',
        label: 'Menu'
    });
    $('.char-counter').each(function () {

        var el = $(this);
        charCounter(el);

    });
    function charCounter(el) {

        var element = el;
        var counter = $(element).find('input');
        var target = $(counter).attr('data-target');

        $(target).bind("change paste keyup", function () {

            var value = $(this).val();
            var length = value.length;

            counter.val(length);

        });

    }
    $('.numeric-input').each(function () {

        var el = $(this);
        numericInput(el);

    });


    /* Numeric Input */
    function numericInput(el) {

        var element = el;
        var input = $(element).find('input');

        $(element).find('.arrow-up').click(function () {
            var value = parseInt(input.val());
            input.val(value + 1);
        });

        $(element).find('.arrow-down').click(function () {
            var value = parseInt(input.val());
            input.val(value - 1);
        });

        input.keypress(function (e) {

            var value = parseInt(String.fromCharCode(e.which));
            if (isNaN(value)) {
                e.preventDefault();
            }

        });

    }
    jQuery('.tp-banner').revolution({
        delay: 9000,
        startwidth: 1170,
        startheight: 500,
        hideThumbs: 10,
        navigationType: "none"
    });




    /* IOS Slider */
    $('.iosSlider').iosSlider({
        scrollbar: true,
        snapToChildren: true,
        desktopClickDrag: true,
        scrollbarMargin: '5px 40px 0 40px',
        scrollbarBorderRadius: 0,
        scrollbarHeight: '2px',
        navPrevSelector: $('.prevButton'),
        navNextSelector: $('.nextButton')
    });





    /* FlexSlider */
    $('.flexslider').flexslider({
        animation: "slide",
        controlNav: false,
        prevText: "",
        nextText: "",
        start: function (slider) {
            $('body').removeClass('loading');
        }
    });

    /* Sidebar Flexslider */
    $('.sidebar-flexslider').flexslider({
        animation: "slide",
        controlNav: true,
        directionNav: false,
        prevText: "",
        nextText: "",
        start: function (slider) {
            $('body').removeClass('loading');
        }
    });
    $('.rating.readonly-rating').raty({
        readOnly: true,
        path: 'js/img',
        score: function () {
            return $(this).attr('data-score');
        }
    });

    // Rate
    $('.rating.rate').raty({
        path: 'js/img',
        score: function () {
            return $(this).attr('data-score');
        }
    });
    function fixRevolutionArrows() {

        $('.tp-banner').each(function () {

            setTimeout(function () {

                var arrow_l = $('.tp-banner').find('.tp-leftarrow');
                var arrow_r = $('.tp-banner').find('.tp-rightarrow');

                var tp_height = $('.tp-banner').height();
                var arrow_height = $(arrow_l).height();
                var arrow_top = (tp_height / 2) - (arrow_height / 2);


                $(arrow_l).css('top', arrow_top);
                $(arrow_r).css('top', arrow_top);

            }, 1000);

        });

    }

    function fixGridView() {

        if ($('.grid-view').length > 0) {

            $('.grid-view.product .product-content').attr('style', '');

            var product_height = $('.grid-view.product img').height();
            var previous_height = $('.grid-view.product .product-content').innerHeight();

            if (previous_height < product_height) {
                $('.grid-view.product .product-content').innerHeight(product_height);
            }
        }

    }
    function singleProduct() {


        /* Product Images Carousel */
        $('#product-carousel').flexslider({
            animation: "slide",
            controlNav: false,
            animationLoop: false,
            directionNav: false,
            slideshow: false,
            itemWidth: 80,
            itemMargin: 0,
            start: function (slider) {

                setActive($('#product-carousel li:first-child img'));
                slider.find('.right-arrow').click(function () {
                    slider.flexAnimate(slider.getTarget("next"));
                });

                slider.find('.left-arrow').click(function () {
                    slider.flexAnimate(slider.getTarget("prev"));
                });

                slider.find('img').click(function () {
                    var large = $(this).attr('data-large');
                    setActive($(this));
                    $('#product-slider img').fadeOut(300, changeImg(large, $('#product-slider img')));
                    $('#product-slider a.fullscreen-button').attr('href', large);
                });

                function changeImg(large, element) {
                    var element = element;
                    var large = large;
                    setTimeout(function () { startF() }, 300);
                    function startF() {
                        element.attr('src', large)
                        element.attr('data-large', large)
                        element.fadeIn(300);
                    }

                }

                function setActive(el) {
                    var element = el;
                    $('#product-carousel img').removeClass('active-item');
                    element.addClass('active-item');
                }

            }

        });



        /* FullScreen Button */
        $('a.fullscreen-button').click(function (e) {
            e.preventDefault();
            var target = $(this).attr('href');
            $('#product-carousel a.fancybox[href="' + target + '"]').trigger('click');
        });


        /* Cloud Zoom */
        $(".cloud-zoom").imagezoomsl({
            zoomrange: [3, 3]
        });


        /* FancyBox */
        $(".fancybox").fancybox();


    }


    $('.owl-carousel').each(function () {

        /* Max items counting */
        var max_items = $(this).attr('data-max-items');
        var tablet_items = max_items;
        if (max_items > 1) {
            tablet_items = max_items - 1;
        }
        var mobile_items = 1;


        /* Install Owl Carousel */
        $(this).owlCarousel({

            items: max_items,
            pagination: false,
            itemsDesktop: [1199, max_items],
            itemsDesktopSmall: [1000, max_items],
            itemsTablet: [920, tablet_items],
            itemsMobile: [560, mobile_items],
        });


        var owl = $(this).data('owlCarousel');

        /* Arrow next */
        $(this).parent().parent().find('.icon-left-dir').click(function (e) {
            owl.prev();
        });

        /* Arrow previous */
        $(this).parent().parent().find('.icon-right-dir').click(function (e) {
            owl.next();
        });

    });



    function installNoUiSlider() {

        if ($('.noUiSlider').length > 0) {

            var min_val = $('.noUiSlider').attr('data-min-value');
            var max_val = $('.noUiSlider').attr('data-max-value');
            var min_range = $('.noUiSlider').attr('data-min-range');
            var max_range = $('.noUiSlider').attr('data-max-range');

            $('.noUiSlider').noUiSlider({
                range: [min_range, max_range]
                , start: [min_val, max_val]
                , connect: true
                , slide: function () {
                    var noui_val = $('.noUiSlider').val();
                    $('.price-range-min').text('$' + noui_val[0]);
                    $('.price-range-max').text('$' + noui_val[1]);
                }
            });

            var noui_val = $('.noUiSlider').val();
            $('.price-range-min').text('$' + noui_val[0]);
            $('.price-range-max').text('$' + noui_val[1]);

        }

    }

    var productButtons = $('.product-actions').not('.full-width');
    productButtons.find('>span:first-child').addClass('current');

    productButtons.find('>span').hover(function () {

        $(this).parent().find('>span').removeClass('current');
        $(this).addClass('current');

    }, function () {

        $(this).removeClass('current');

    });

    productButtons.hover(function () {

    }, function () {
        $(this).find('>span:first-child').addClass('current');
    });

    function accordionsOn() {

        $('.accordion').each(function () {

            var accordion = $(this);
            accordion.find('.accordion-content').hide();
            accordion.find('>ul>li:first-child').addClass('accordion-active').find('.accordion-content').show();
            accordion.find('.accordion-header').click(function () {

                if ($(this).parent().hasClass('accordion-active')) {
                    $(this).parent().removeClass('accordion-active');
                    $(this).parent().find('.accordion-content').slideUp(300);
                } else {
                    $(this).parent().parent().find('li.accordion-active').removeClass('accordion-active').find('.accordion-content').slideUp(300);
                    $(this).parent().addClass('accordion-active').find('.accordion-content').slideDown(300)
                }

            });

        });

    }
    function selectBox() {

        var config = {
            '.chosen-select': { disable_search_threshold: 10 },
            '.chosen-select-full-width': { disable_search_threshold: 10, width: '100%' },
            '.chosen-select-search': { disable_search_threshold: 10, width: '100%' }
        }
        for (var selector in config) {
            $(selector).chosen(config[selector]);
        }

    }
    function quickViewModal(el) {

        $('body').append('<div id="quick-view-modal"><div id="quick-view-content"><div id="quick-view-close"></div><div class="quick-view-content"><div class="quick-view-container col-lg-12 col-md-12 col-sm-12"></div></div></div></div>');
        $('#quick-view-modal').hide();

        $('#quick-view-close').click(function () {

            $('#quick-view-modal').fadeOut(300);

        });

        /* Scroll Bar */
        $('.quick-view-content').perfectScrollbar({ wheelSpeed: 40, suppressScrollX: true });

        var elements = el;
        elements.click(function (e) {

            e.preventDefault();
            var target = $(this).attr('href');

            $('#quick-view-content .quick-view-container').load(target + ' #product-single', function () {


                /* Rating Box */
                $('#quick-view-modal .rating.readonly-rating').raty({
                    readOnly: true, path: 'js/img', score: function () {
                        return $(this).attr('data-score');
                    }
                });
                $('#quick-view-modal .rating.rate').raty({
                    path: 'js/img', score: function () {
                        return $(this).attr('data-score');
                    }
                });


                /* Accordions */
                var productButtons = $('#quick-view-content .product-actions').not('.full-width');
                productButtons.find('>span:first-child').addClass('current');

                productButtons.find('>span').hover(function () {

                    $(this).parent().find('>span').removeClass('current');
                    $(this).addClass('current');

                }, function () {

                    $(this).removeClass('current');

                });

                productButtons.hover(function () {

                }, function () {
                    $(this).find('>span:first-child').addClass('current');
                });


                /* Tabs */
                tabsOn();

                /* Numeric Input */
                $('#quick-view-modal .numeric-input').each(function () {

                    var el = $(this);
                    numericInput(el);

                });

                /* Char Counter */
                $('#quick-view-modal .char-counter').each(function () {

                    var el = $(this);
                    charCounter(el);

                });


                var po = document.createElement('script'); po.type = 'text/javascript'; po.async = true;
                po.src = 'https://apis.google.com/js/platform.js';
                var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(po, s);


                /* Product Carousel */
                $('#quick-view-modal #product-carousel').flexslider({
                    animation: "slide",
                    controlNav: false,
                    animationLoop: false,
                    directionNav: false,
                    slideshow: false,
                    itemWidth: 80,
                    itemMargin: 0,
                    start: function (slider) {
                        setActive($('#product-carousel li:first-child img'));
                        slider.find('.right-arrow').click(function () {
                            slider.flexAnimate(slider.getTarget("next"));
                        });
                        slider.find('.left-arrow').click(function () {
                            slider.flexAnimate(slider.getTarget("prev"));
                        });
                        slider.find('img').click(function () {
                            var large = $(this).attr('data-large');
                            setActive($(this));
                            $('#product-slider img').fadeOut(300, changeImg(large, $('#product-slider img')));
                        });
                        function changeImg(large, element) {
                            var element = element;
                            var large = large;
                            setTimeout(function () { startF() }, 300);
                            function startF() {
                                element.attr('src', large)
                                element.attr('data-large', large)
                                element.fadeIn(300);
                            }

                        }
                        function setActive(el) {
                            var element = el;
                            $('#product-carousel img').removeClass('active-item');
                            element.addClass('active-item');
                        }
                    }
                });

                $('#quick-view-modal').fadeIn(300);


                /* Positioning */
                var q_width = $('#quick-view-content').width();
                var q_height = $('#quick-view-content').height();
                var q_margin = ($(window).height() - q_height) / 2;

                $('#quick-view-content').css('margin-top', q_margin + 'px');


                /* Cloud Zoom */
                $("#quick-view-modal .cloud-zoom").imagezoomsl({
                    zoomrange: [3, 3]
                });

                $('.quick-view-content').perfectScrollbar('update');
                $('.quick-view-content').css('overflow', 'hidden');

                $('.quick-view-content').click(function () {
                    $(this).perfectScrollbar('update');
                });

                /* Select Box */
                var config = {
                    '#quick-view-content .chosen-select': { disable_search_threshold: 10 }
                }
                for (var selector in config) {
                    $(selector).chosen(config[selector]);
                }

            });

        });

    }
    accordionsOn(); // Turn Accordions On

    installCarousels(); // Install Owl Carousels

    installNoUiSlider();
    $(window).resize(function () {

        // Set the new Window Width and Height
        windowWidth = $(window).width();
        windowHeight = $(window).height();




        fixRevolutionArrows(); // Fix Revolution Sliders Arrows


    });
    (function (d, s, id) {
        var js, fjs = d.getElementsByTagName(s)[0];
        if (d.getElementById(id)) return;
        js = d.createElement(s); js.id = id;
        js.src = "//connect.facebook.net/vi_VN/sdk.js#xfbml=1&version=v2.6&appId=641859092618276";
        fjs.parentNode.insertBefore(js, fjs);
    }(document, 'script', 'facebook-jssdk'));   
}
