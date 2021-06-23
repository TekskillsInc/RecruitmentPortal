<%--  <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> --%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles-extras" prefix="tilesx" %>


<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>

<!DOCTYPE html PUBLIC "-/W3C/DTD HTML 4.01 Transitional/EN" "http:/www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">


  
    <link href="resources/assets/stylesheets/bootstrap/bootstrap.css" media="all" rel="stylesheet" type="text/css" />
    <link href="resources/assets/stylesheets/bootstrap/bootstrap-responsive.css" media="all" rel="stylesheet" type="text/css" />
  
    <link href="resources/assets/stylesheets/jquery_ui/jquery.ui-1.10.0.custom.css" media="all" rel="stylesheet" type="text/css" />
    <link href="resources/assets/stylesheets/jquery_ui/jquery.ui.1.10.0.ie.css" media="all" rel="stylesheet" type="text/css" />
   
    <link href="resources/assets/stylesheets/plugins/bootstrap_switch/bootstrap-switch.css" media="all" rel="stylesheet" type="text/css" />
    
    <link href="resources/assets/stylesheets/plugins/xeditable/bootstrap-editable.css" media="all" rel="stylesheet" type="text/css" />
    <link href="resources/assets/stylesheets/plugins/common/bootstrap-wysihtml5.css" media="all" rel="stylesheet" type="text/css" />
    
    <link href="resources/assets/stylesheets/plugins/common/bootstrap-wysihtml5.css" media="all" rel="stylesheet" type="text/css" />
   
   
    <link href="resources/assets/stylesheets/plugins/fullcalendar/fullcalendar.css" media="all" rel="stylesheet" type="text/css" />
    
   
    <link href="resources/assets/stylesheets/plugins/select2/select2.css" media="all" rel="stylesheet" type="text/css" />
   
    <link href="resources/assets/stylesheets/plugins/mention/mention.css" media="all" rel="stylesheet" type="text/css" />
   
    <link href="resources/assets/stylesheets/plugins/tabdrop/tabdrop.css" media="all" rel="stylesheet" type="text/css" />
  
    <link href="resources/assets/stylesheets/plugins/jgrowl/jquery.jgrowl.min.css" media="all" rel="stylesheet" type="text/css" />
    
     <link href="resources/assets/stylesheets/plugins/datatables/bootstrap-datatable.css" media="all" rel="stylesheet" type="text/css" />
   
    <link href="resources/assets/stylesheets/plugins/dynatree/ui.dynatree.css" media="all" rel="stylesheet" type="text/css" />
  
    <link href="resources/assets/stylesheets/plugins/bootstrap_colorpicker/bootstrap-colorpicker.css" media="all" rel="stylesheet" type="text/css" />
  

  
    
   
    <link href="resources/assets/stylesheets/plugins/flags/flags.css" media="all" rel="stylesheet" type="text/css" />
   
    <link href="resources/assets/stylesheets/plugins/slider_nav/slidernav.css" media="all" rel="stylesheet" type="text/css" />
    
    <link href="resources/assets/stylesheets/plugins/fuelux/wizard.css" media="all" rel="stylesheet" type="text/css" />
    
    <link href="resources/assets/stylesheets/light-theme.css" media="all" id="color-settings-body-color" rel="stylesheet" type="text/css" />
    <link href="resources/assets/stylesheets/theme-colors.css" media="all" rel="stylesheet" type="text/css" />
    <link href="resources/assets/stylesheets/demo.css" media="all" rel="stylesheet" type="text/css" />
<tilesx:useAttribute name="cssitems" />
<c:forEach var="href" items="${cssitems}">
    <link type="text/css" rel="stylesheet" href="${href}" />
</c:forEach>
<tilesx:useAttribute name="jsitems" />
<c:forEach var="src" items="${jsitems}">
<script src="${src}" type="text/javascript"></script>
</c:forEach>
<script src="resources/assets/javascripts/jquery/jquery.min.js" type="text/javascript"></script>
   
  
  
    <script src="resources/assets/javascripts/jquery/jquery-migrate.min.js" type="text/javascript"></script>
  
    <script src="resources/assets/javascripts/jquery_ui/jquery-ui.min.js" type="text/javascript"></script>
   
    <script src="resources/assets/javascripts/plugins/jquery_ui_touch_punch/jquery.ui.touch-punch.min.js" type="text/javascript"></script>
    
    <script src="resources/assets/javascripts/bootstrap/bootstrap.min.js" type="text/javascript"></script>
    <script src="resources/assets/javascripts/plugins/flot/excanvas.js" type="text/javascript"></script>
  
    <script src="resources/assets/javascripts/plugins/sparklines/jquery.sparkline.min.js" type="text/javascript"></script> 
   
    <script src="resources/assets/javascripts/plugins/flot/flot.min.js" type="text/javascript"></script>
    <script src="resources/assets/javascripts/plugins/flot/flot.resize.js" type="text/javascript"></script>
    <script src="resources/assets/javascripts/plugins/flot/flot.pie.js" type="text/javascript"></script>
    
    
   
    <script src="resources/assets/javascripts/plugins/fullcalendar/fullcalendar.min.js" type="text/javascript"></script>
    
    
    <script src="resources/assets/javascripts/plugins/common/wysihtml5.min.js" type="text/javascript"></script>
    <script src="resources/assets/javascripts/plugins/common/bootstrap-wysihtml5.js" type="text/javascript"></script>
   
    <script src="resources/assets/javascripts/plugins/select2/select2.js" type="text/javascript"></script>
    
    <script src="resources/assets/javascripts/plugins/bootstrap_colorpicker/bootstrap-colorpicker.min.js" type="text/javascript"></script>
    
    <script src="resources/assets/javascripts/plugins/mention/mention.min.js" type="text/javascript"></script>
    
    <script src="resources/assets/javascripts/plugins/input_mask/bootstrap-inputmask.min.js" type="text/javascript"></script>
    
    <script src="resources/assets/javascripts/plugins/fileinput/bootstrap-fileinput.js" type="text/javascript"></script>
    
    <script src="resources/assets/javascripts/plugins/modernizr/modernizr.min.js" type="text/javascript"></script>
    
  
    
    <script src="resources/assets/javascripts/plugins/fileupload/tmpl.min.js" type="text/javascript"></script>
    <script src="resources/assets/javascripts/plugins/fileupload/load-image.min.js" type="text/javascript"></script>
    <script src="resources/assets/javascripts/plugins/fileupload/canvas-to-blob.min.js" type="text/javascript"></script>
    <script src="resources/assets/javascripts/plugins/fileupload/jquery.iframe-transport.min.js" type="text/javascript"></script>
    <script src="resources/assets/javascripts/plugins/fileupload/jquery.fileupload.min.js" type="text/javascript"></script>
    <script src="resources/assets/javascripts/plugins/fileupload/jquery.fileupload-fp.min.js" type="text/javascript"></script>
    <script src="resources/assets/javascripts/plugins/fileupload/jquery.fileupload-ui.min.js" type="text/javascript"></script>
    <script src="resources/assets/javascripts/plugins/fileupload/jquery.fileupload-init.js" type="text/javascript"></script> 
   
    <script src="resources/assets/javascripts/plugins/slimscroll/jquery.slimscroll.min.js" type="text/javascript"></script>
 
    <script src="resources/assets/javascripts/plugins/autosize/jquery.autosize-min.js" type="text/javascript"></script>
  
    <script src="resources/assets/javascripts/plugins/charCount/charCount.js" type="text/javascript"></script>
  
    <script src="resources/assets/javascripts/plugins/validate/jquery.validate.min.js" type="text/javascript"></script>
    <script src="resources/assets/javascripts/plugins/validate/additional-methods.js" type="text/javascript"></script>
    
    <script src="resources/assets/javascripts/plugins/naked_password/naked_password-0.2.4.min.js" type="text/javascript"></script>
  
    <script src="resources/assets/javascripts/plugins/nestable/jquery.nestable.js" type="text/javascript"></script>

    <script src="resources/assets/javascripts/plugins/tabdrop/bootstrap-tabdrop.js" type="text/javascript"></script>
   
    <script src="resources/assets/javascripts/plugins/jgrowl/jquery.jgrowl.min.js" type="text/javascript"></script>
 
    <script src="resources/assets/javascripts/plugins/bootbox/bootbox.min.js" type="text/javascript"></script>
    
   
     
    <script src="resources/assets/javascripts/plugins/xeditable/bootstrap-editable.min.js" type="text/javascript"></script>
    
    <script src="resources/assets/javascripts/plugins/xeditable/wysihtml5.js" type="text/javascript"></script>
    
    <script src="resources/assets/javascripts/plugins/dynatree/jquery.dynatree.min.js" type="text/javascript"></script>
    
    
     <script src="resources/assets/javascripts/plugins/bootstrap_daterangepicker/moment.min.js" type="text/javascript"></script>
    <script src="resources/assets/javascripts/plugins/bootstrap_daterangepicker/bootstrap-daterangepicker.js" type="text/javascript"></script>
  
    <script src="resources/assets/javascripts/plugins/bootstrap_maxlength/bootstrap-maxlength.min.js" type="text/javascript"></script>
  
    <script src="resources/assets/javascripts/plugins/bootstrap_hover_dropdown/twitter-bootstrap-hover-dropdown.min.js" type="text/javascript"></script>
 
    <script src="resources/assets/javascripts/plugins/slider_nav/slidernav-min.js" type="text/javascript"></script>
  
    <script src="resources/assets/javascripts/plugins/fuelux/wizard.js" type="text/javascript"></script>
    
    <script src="resources/assets/javascripts/nav.js" type="text/javascript"></script>
   
 
 
    <script src="resources/assets/javascripts/demo/jquery.mockjax.js" type="text/javascript"></script>
    <script src="resources/assets/javascripts/demo/inplace_editing.js" type="text/javascript"></script>
  
   
    <link href="resources/assets/javascripts/charts/amcharts1.js" media="all" rel="stylesheet" type="text/css" />
    <link href="resources/assets/javascripts/charts/chart.js" media="all" rel="stylesheet" type="text/css" />
    <link href="resources/assets/javascripts/charts.js" media="all" rel="stylesheet" type="text/css" />
    <script src="resources/assets/javascripts/demo/demo.js" type="text/javascript"></script>
</head>
<%-- <body>
    <div>
        <tiles:insertAttribute name="header" />
        <tiles:insertAttribute name="left_bar" />
        <tiles:insertAttribute name="body" />
        <tiles:insertAttribute name="footer" />
    </div>
    </body> --%>
    
    
    <body>
        <header id="header">
            <tiles:insertAttribute name="header" />
        </header>
     
        <section id="sidemenu">
            <tiles:insertAttribute name="left_bar" />
        </section>
             
        <section id="site-content">
            <tiles:insertAttribute name="body" />
        </section>
         
        <footer id="footer">
            <tiles:insertAttribute name="footer" />
        </footer>
</body>
</html> 