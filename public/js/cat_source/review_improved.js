/**
 * Main file of review_improved feature.
 *
 * This file is divided in two parts: the first is for the
 * initialization of the review interface, the second for
 * initialization of translate page.
 *
 * For translate and review pages two different tabs are configured
 * for the segment footer.
 *
 * For translate page, review specific statuses are not offered.
 *
 */
ReviewImproved = window.ReviewImproved || {};

ReviewImproved.enabled = function() {
    return Review.type == 'improved';
}

if (1)
(function($, ReviewImproved, undefined) {

    var mountpoint ;
    $(function() {
        mountpoint = $('[data-mount=review-side-panel]')[0];
    });

    function mountPanelComponent () {
        ReactDOM.render( React.createElement( ReviewSidePanel, {
        } ), mountpoint );
    }

    function unmountPanelComponent () {
        ReactDOM.unmountComponentAtNode( mountpoint );
    }

    $.extend( ReviewImproved, {
        openPanel : function() {
            $('article').addClass('review-panel-opened');
            $('body').addClass('side-tools-opened');
            hackSnapEngage( true );
            mountPanelComponent();
        },

        isPanelOpened : function() {
            $('article').hasClass('review-panel-opened');
        },

        closePanel : function() {
            unmountPanelComponent();
            hackSnapEngage( false );

            $('article').removeClass('review-panel-opened');
            $('body').removeClass('side-tools-opened');
        }
    });
})(jQuery, ReviewImproved);

/**
 * Review page
 */

if ( ReviewImproved.enabled() && config.isReview ) {
    SegmentActivator.registry.push(function( sid ) {
        var segment = UI.Segment.find( sid );
        // TODO: refactor this, the click to activate a
        // segment is not a good way to handle.
        segment.el.find('.errorTaggingArea').click();
    });

    $.extend(ReviewImproved, {
        reloadQualityReport : function() {
            var path  = sprintf('/api/v2/jobs/%s/%s/quality-report',
                config.id_job, config.password);

            $.getJSON( path )
                .success( function( data ) {
                    console.debug( data );

                    if ( parseInt(data.is_pass) ) {
                        $('#quality-report').attr('data-vote', 'excellent') ; }
                    else {
                        $('#quality-report').attr('data-vote', 'fail');
                    }
                });
        },

    });
}
