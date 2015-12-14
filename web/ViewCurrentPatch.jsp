
<%@page import="com.pes.bean.PieChartData"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%--    
    Document   : StartNewPatch
    Created on : Dec 2, 2015, 8:42:25 PM
    Author     : neerajkumar.b.lad
--%>

<%@page import="com.pes.dao.slavePatchExecutionStatusDao"%>
<%@page import="com.pes.bean.slavePatchExecutionStatusBean"%>
<%@page import="java.util.List"%>
<%@page import="com.pes.bean.masterPatchBean"%>
<%@page import="com.pes.dao.MasterPatchDao"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Start New Patch</title>
        <script src="https://code.jquery.com/jquery-1.10.2.js"></script>
        <link rel="stylesheet" type="text/css" href="css/tableskin.css">
        <script>
            $("select")
                    .change(function () {
                        var str = "";
                        $("select option:selected").each(function () {
                            str += $(this).text() + " ";
                        });
                        $("label").text(str);
                    })
                    .change();
        </script>

        <script>
            $(function () {
                $("table").stickyTableHeaders();
            });

            /*! Copyright (c) 2011 by Jonas Mosbech - https://github.com/jmosbech/StickyTableHeaders
             MIT license info: https://github.com/jmosbech/StickyTableHeaders/blob/master/license.txt */

            ;
            (function ($, window, undefined) {
                'use strict';

                var name = 'stickyTableHeaders',
                        id = 0,
                        defaults = {
                            fixedOffset: 0,
                            leftOffset: 0,
                            marginTop: 0,
                            scrollableArea: window
                        };

                function Plugin(el, options) {
                    // To avoid scope issues, use 'base' instead of 'this'
                    // to reference this class from internal events and functions.
                    var base = this;

                    // Access to jQuery and DOM versions of element
                    base.$el = $(el);
                    base.el = el;
                    base.id = id++;
                    base.$window = $(window);
                    base.$document = $(document);

                    // Listen for destroyed, call teardown
                    base.$el.bind('destroyed',
                            $.proxy(base.teardown, base));

                    // Cache DOM refs for performance reasons
                    base.$clonedHeader = null;
                    base.$originalHeader = null;

                    // Keep track of state
                    base.isSticky = false;
                    base.hasBeenSticky = false;
                    base.leftOffset = null;
                    base.topOffset = null;

                    base.init = function () {
                        base.$el.each(function () {
                            var $this = $(this);

                            // remove padding on <table> to fix issue #7
                            $this.css('padding', 0);

                            base.$originalHeader = $('thead:first', this);
                            base.$clonedHeader = base.$originalHeader.clone();
                            $this.trigger('clonedHeader.' + name, [base.$clonedHeader]);

                            base.$clonedHeader.addClass('tableFloatingHeader');
                            base.$clonedHeader.css('display', 'none');

                            base.$originalHeader.addClass('tableFloatingHeaderOriginal');

                            base.$originalHeader.after(base.$clonedHeader);

                            base.$printStyle = $('<style type="text/css" media="print">' +
                                    '.tableFloatingHeader{display:none !important;}' +
                                    '.tableFloatingHeaderOriginal{position:static !important;}' +
                                    '</style>');
                            $('head').append(base.$printStyle);
                        });

                        base.setOptions(options);
                        base.updateWidth();
                        base.toggleHeaders();
                        base.bind();
                    };

                    base.destroy = function () {
                        base.$el.unbind('destroyed', base.teardown);
                        base.teardown();
                    };

                    base.teardown = function () {
                        if (base.isSticky) {
                            base.$originalHeader.css('position', 'static');
                        }
                        $.removeData(base.el, 'plugin_' + name);
                        base.unbind();

                        base.$clonedHeader.remove();
                        base.$originalHeader.removeClass('tableFloatingHeaderOriginal');
                        base.$originalHeader.css('visibility', 'visible');
                        base.$printStyle.remove();

                        base.el = null;
                        base.$el = null;
                    };

                    base.bind = function () {
                        base.$scrollableArea.on('scroll.' + name, base.toggleHeaders);
                        if (!base.isWindowScrolling) {
                            base.$window.on('scroll.' + name + base.id, base.setPositionValues);
                            base.$window.on('resize.' + name + base.id, base.toggleHeaders);
                        }
                        base.$scrollableArea.on('resize.' + name, base.toggleHeaders);
                        base.$scrollableArea.on('resize.' + name, base.updateWidth);
                    };

                    base.unbind = function () {
                        // unbind window events by specifying handle so we don't remove too much
                        base.$scrollableArea.off('.' + name, base.toggleHeaders);
                        if (!base.isWindowScrolling) {
                            base.$window.off('.' + name + base.id, base.setPositionValues);
                            base.$window.off('.' + name + base.id, base.toggleHeaders);
                        }
                        base.$scrollableArea.off('.' + name, base.updateWidth);
                    };

                    base.toggleHeaders = function () {
                        if (base.$el) {
                            base.$el.each(function () {
                                var $this = $(this),
                                        newLeft,
                                        newTopOffset = base.isWindowScrolling ? (
                                                isNaN(base.options.fixedOffset) ? base.options.fixedOffset.outerHeight() : base.options.fixedOffset) : base.$scrollableArea.offset().top + (!isNaN(base.options.fixedOffset) ? base.options.fixedOffset : 0),
                                        offset = $this.offset(),
                                        scrollTop = base.$scrollableArea.scrollTop() + newTopOffset,
                                        scrollLeft = base.$scrollableArea.scrollLeft(),
                                        scrolledPastTop = base.isWindowScrolling ? scrollTop > offset.top : newTopOffset > offset.top,
                                        notScrolledPastBottom = (base.isWindowScrolling ? scrollTop : 0) < (offset.top + $this.height() - base.$clonedHeader.height() - (base.isWindowScrolling ? 0 : newTopOffset));

                                if (scrolledPastTop && notScrolledPastBottom) {
                                    newLeft = offset.left - scrollLeft + base.options.leftOffset;
                                    base.$originalHeader.css({
                                        'position': 'fixed',
                                        'margin-top': base.options.marginTop,
                                        'left': newLeft,
                                        'z-index': 3 // #18: opacity bug
                                    });
                                    base.leftOffset = newLeft;
                                    base.topOffset = newTopOffset;
                                    base.$clonedHeader.css('display', '');
                                    if (!base.isSticky) {
                                        base.isSticky = true;
                                        // make sure the width is correct: the user might have resized the browser while in static mode
                                        base.updateWidth();
                                    }
                                    base.setPositionValues();
                                } else if (base.isSticky) {
                                    base.$originalHeader.css('position', 'static');
                                    base.$clonedHeader.css('display', 'none');
                                    base.isSticky = false;
                                    base.resetWidth($('td,th', base.$clonedHeader), $('td,th', base.$originalHeader));
                                }
                            });
                        }
                    };

                    base.setPositionValues = function () {
                        var winScrollTop = base.$window.scrollTop(),
                                winScrollLeft = base.$window.scrollLeft();
                        if (!base.isSticky || winScrollTop < 0 || winScrollTop + base.$window.height() > base.$document.height() || winScrollLeft < 0 || winScrollLeft + base.$window.width() > base.$document.width()) {
                            return;
                        }
                        base.$originalHeader.css({
                            'top': base.topOffset - (base.isWindowScrolling ? 0 : winScrollTop),
                            'left': base.leftOffset - (base.isWindowScrolling ? 0 : winScrollLeft)
                        });
                    };

                    base.updateWidth = function () {
                        if (!base.isSticky) {
                            return;
                        }
                        // Copy cell widths from clone
                        if (!base.$originalHeaderCells) {
                            base.$originalHeaderCells = $('th,td', base.$originalHeader);
                        }
                        if (!base.$clonedHeaderCells) {
                            base.$clonedHeaderCells = $('th,td', base.$clonedHeader);
                        }
                        var cellWidths = base.getWidth(base.$clonedHeaderCells);
                        base.setWidth(cellWidths, base.$clonedHeaderCells, base.$originalHeaderCells);

                        // Copy row width from whole table
                        base.$originalHeader.css('width', base.$clonedHeader.width());
                    };

                    base.getWidth = function ($clonedHeaders) {
                        var widths = [];
                        $clonedHeaders.each(function (index) {
                            var width, $this = $(this);

                            if ($this.css('box-sizing') === 'border-box') {
                                width = $this[0].getBoundingClientRect().width; // #39: border-box bug
                            } else {
                                var $origTh = $('th', base.$originalHeader);
                                if ($origTh.css('border-collapse') === 'collapse') {
                                    if (window.getComputedStyle) {
                                        width = parseFloat(window.getComputedStyle(this, null).width);
                                    } else {
                                        // ie8 only
                                        var leftPadding = parseFloat($this.css('padding-left'));
                                        var rightPadding = parseFloat($this.css('padding-right'));
                                        // Needs more investigation - this is assuming constant border around this cell and it's neighbours.
                                        var border = parseFloat($this.css('border-width'));
                                        width = $this.outerWidth() - leftPadding - rightPadding - border;
                                    }
                                } else {
                                    width = $this.width();
                                }
                            }

                            widths[index] = width;
                        });
                        return widths;
                    };

                    base.setWidth = function (widths, $clonedHeaders, $origHeaders) {
                        $clonedHeaders.each(function (index) {
                            var width = widths[index];
                            $origHeaders.eq(index).css({
                                'min-width': width,
                                'max-width': width
                            });
                        });
                    };

                    base.resetWidth = function ($clonedHeaders, $origHeaders) {
                        $clonedHeaders.each(function (index) {
                            var $this = $(this);
                            $origHeaders.eq(index).css({
                                'min-width': $this.css('min-width'),
                                'max-width': $this.css('max-width')
                            });
                        });
                    };

                    base.setOptions = function (options) {
                        base.options = $.extend({}, defaults, options);
                        base.$scrollableArea = $(base.options.scrollableArea);
                        base.isWindowScrolling = base.$scrollableArea[0] === window;
                    };

                    base.updateOptions = function (options) {
                        base.setOptions(options);
                        // scrollableArea might have changed
                        base.unbind();
                        base.bind();
                        base.updateWidth();
                        base.toggleHeaders();
                    };

                    // Run initializer
                    base.init();
                }

                // A plugin wrapper around the constructor,
                // preventing against multiple instantiations
                $.fn[name] = function (options) {
                    return this.each(function () {
                        var instance = $.data(this, 'plugin_' + name);
                        if (instance) {
                            if (typeof options === 'string') {
                                instance[options].apply(instance);
                            } else {
                                instance.updateOptions(options);
                            }
                        } else if (options !== 'destroy') {
                            $.data(this, 'plugin_' + name, new Plugin(this, options));
                        }
                    });
                };

            })(jQuery, window);
        </script>
   
    <script type="text/javascript" src="https://www.google.com/jsapi"></script>
    <script type="text/javascript">
      google.load("visualization", "1", {packages:["corechart"]});
      google.setOnLoadCallback(drawChart);
      function drawChart() {
        var data = google.visualization.arrayToDataTable([
          ['Status', 'process'],
          ['NA',     11],
          ['Not Started',      2],
          ['In-Progress',  2],
          ['Completed', 2],
          ['On Hold',    7],
          ['Issue',    7]
        ]);

        var options = {
          title: 'Patch Execution Status',
          is3D: true
        };

        var chart = new google.visualization.PieChart(document.getElementById('piechart_3d'));
        chart.draw(data, options);
      }
    </script>
    
    </head>
    <body>
        <%
            MasterPatchDao masterpatchdao = new MasterPatchDao();
            List<masterPatchBean> lstpatch = masterpatchdao.getAllNotEndedMasterPatch();    
        %>

        <div >
            
            <form   name="frmGetPatchDetails"  >
                
                <select name="drpViewOpenPatch" id="iddrpViewOpenPatch">                
                    <%
                        for (masterPatchBean p : lstpatch) {
                    %>
                    <option><%=p.getPatchversion()%></option>                  
                    <%
                        }
                    %>
                </select>                               
                <input type="submit" value="Get Details" name="btnDetails" />                
                <br/>
                <br/>

                 <div id="piechart_3d" style="width: 350px; height: 200px;"></div>
                <h2>Current Selected Patch :  <lable id="idlbl"> <%=request.getParameter("drpViewOpenPatch")%></lable> </h2>

                <table border="1" class="gridtable">                
                    <tbody>
                
                <thead>
                <tr>
                        <th>Sub Process Name</th>                    
                        <th>Assigned To</th>
                        <th>Status</th>
                        <th>Comment</th>
                        <th>Issue ID</th>                        
                    </tr>
                </thead>
                    <%
                        String patchname = request.getParameter("drpViewOpenPatch");
                        slavePatchExecutionStatusDao slavepatchexecutionstatusdao = new slavePatchExecutionStatusDao();
                        List<slavePatchExecutionStatusBean> lstSelectedPatchProcess = slavepatchexecutionstatusdao.getAllSelectedPatchProcess(patchname);

                        String cProcess = "";
                        for (slavePatchExecutionStatusBean process : lstSelectedPatchProcess) {
                            if (!cProcess.equalsIgnoreCase(process.getProcessname())) {
                                cProcess = process.getProcessname();

                    %>                    
                    <tr>
                        <th colspan="5"><label name="txtProcessName"><%= process.getProcessname()%></label></th>                
                    </tr>                      
                    <%
                        }

                    %>

                    <tr>
                        <td><label name="txtSubProcessName"><%= process.getSubprocessname()%></label>                            
                        </td>                    
                        <td>
                            <label  name="txtAssignedTo"><%= process.getAssignedto() == null ? "" :process.getAssignedto()%></label>
                        </td>
                        <td>
                            <label name="txtstatus"><%= process.getStatus() == null ? "" : process.getStatus()%></label>
                        </td>
                        <td>
                            <label name="txtComment"><%= process.getComment() == null ? "" : process.getComment()%></label>                            
                        </td>
                        <td>
                            <label name="txtIssueID"><%= process.getIssueid() == null ? "" : process.getIssueid()%></label>                                                        
                        </td> 
                        <td>
                            <a href="SlavePatchExecutionStatusController?action=editform&patchversion=<%=process.getPatchversion()%>&subprocessname=<%=process.getSubprocessname()%>">Update</a>
                        </td>                          
                    </tr>
                    <%
                        }
                    %>
                      
                    </tbody>
                </table> 
                    
            </form>
        </div>
    </body>
</html>
