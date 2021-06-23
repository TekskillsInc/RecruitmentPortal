<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title>Recruitment Portal</title>
<link
    href="resources/assets/stylesheets/bootstrap/bootstrap.css"
    media="all" rel="stylesheet" type="text/css" />
<link
    href="resources/assets/stylesheets/bootstrap/bootstrap-responsive.css"
    media="all" rel="stylesheet" type="text/css" />
<!-- / jquery ui -->
<link
    href="resources/assets/stylesheets/jquery_ui/jquery.ui-1.10.0.custom.css"
    media="all" rel="stylesheet" type="text/css" />
<link
    href="resources/assets/stylesheets/jquery_ui/jquery.ui.1.10.0.ie.css"
    media="all" rel="stylesheet" type="text/css" />
<!-- / switch buttons -->
<link
    href="resources/assets/stylesheets/plugins/bootstrap_switch/bootstrap-switch.css"
    media="all" rel="stylesheet" type="text/css" />
<!-- / xeditable -->
<link
    href="resources/assets/stylesheets/plugins/xeditable/bootstrap-editable.css"
    media="all" rel="stylesheet" type="text/css" />
<link
    href="resources/assets/stylesheets/plugins/common/bootstrap-wysihtml5.css"
    media="all" rel="stylesheet" type="text/css" />
<!-- / wysihtml5 (wysywig) -->
<link
    href="resources/assets/stylesheets/plugins/common/bootstrap-wysihtml5.css"
    media="all" rel="stylesheet" type="text/css" />
<!-- / jquery file upload -->
<link
    href="resources/assets/stylesheets/plugins/jquery_fileupload/jquery.fileupload-ui.css"
    media="all" rel="stylesheet" type="text/css" />
<!-- / full calendar -->
<link
    href="resources/assets/stylesheets/plugins/fullcalendar/fullcalendar.css"
    media="all" rel="stylesheet" type="text/css" />
<!-- / select2 -->
<link
    href="resources/assets/stylesheets/plugins/select2/select2.css"
    media="all" rel="stylesheet" type="text/css" />
<!-- / mention -->
<link
    href="resources/assets/stylesheets/plugins/mention/mention.css"
    media="all" rel="stylesheet" type="text/css" />
<!-- / tabdrop (responsive tabs) -->
<link
    href="resources/assets/stylesheets/plugins/tabdrop/tabdrop.css"
    media="all" rel="stylesheet" type="text/css" />
<!-- / jgrowl notifications -->
<link
    href="resources/assets/stylesheets/plugins/jgrowl/jquery.jgrowl.min.css"
    media="all" rel="stylesheet" type="text/css" />
<!-- / datatables -->
<link
    href="resources/assets/stylesheets/plugins/datatables/bootstrap-datatable.css"
    media="all" rel="stylesheet" type="text/css" />
<!-- / dynatrees (file trees) -->
<link
    href="resources/assets/stylesheets/plugins/dynatree/ui.dynatree.css"
    media="all" rel="stylesheet" type="text/css" />
<!-- / color picker -->
<link
    href="resources/assets/stylesheets/plugins/bootstrap_colorpicker/bootstrap-colorpicker.css"
    media="all" rel="stylesheet" type="text/css" />
<!-- / datetime picker -->
<link
    href="resources/assets/stylesheets/plugins/bootstrap_datetimepicker/bootstrap-datetimepicker.min.css"
    media="all" rel="stylesheet" type="text/css" />
<!-- / daterange picker) -->
<link
    href="resources/assets/stylesheets/plugins/bootstrap_daterangepicker/bootstrap-daterangepicker.css"
    media="all" rel="stylesheet" type="text/css" />
<!-- / flags (country flags) -->
<link
    href="resources/assets/stylesheets/plugins/flags/flags.css"
    media="all" rel="stylesheet" type="text/css" />
<!-- / slider nav (address book) -->
<link
    href="resources/assets/stylesheets/plugins/slider_nav/slidernav.css"
    media="all" rel="stylesheet" type="text/css" />
<!-- / fuelux (wizard) -->
<link
    href="resources/assets/stylesheets/plugins/fuelux/wizard.css"
    media="all" rel="stylesheet" type="text/css" />
<!-- / theme files [required files] -->
<link
    href="resources/assets/stylesheets/light-theme.css"
    media="all" id="color-settings-body-color" rel="stylesheet"
    type="text/css" />
<link
    href="resources/assets/stylesheets/theme-colors.css"
    media="all" rel="stylesheet" type="text/css" />
<link href="resources/assets/stylesheets/demo.css"
    media="all" rel="stylesheet" type="text/css" />
<style type="text/css">
    #successmsg1{
        display:none;
    }
</style>
</head>
<body class='contrast-orange sign-in contrast-background'>
    <div id='wrapper'>
       
        <div style="background-color: black; padding: 10px 15px;">
			<img src="resources/assets/images/logo-web.png"
				width="200" height="51" border="0" />
		
		</div>
        <div class='controls' style="padding: 9% 0;">
            <div class='form-wrapper'>
                <h1 class='text-center'>Sign in</h1>

                <%-- <h4>
                    <c:out value="${error}" />
                </h4> --%>
                <form action='login' method='POST'>
                    <div class='row-fluid'>
                        <div class='span12 icon-over-input'>
                            <input value="" placeholder="username" class="span12" name="username"
                                id="username" type="text" required/> <i class='icon-user muted'></i>
                        </div>
                    </div>
                    <div class='row-fluid'>
                        <div class='span12 icon-over-input'>
                            <input value="" placeholder="Password" data-rule-required='true' class="span12"
                                name="password" id="password" type="password" required/> <i
                                class='icon-lock muted'></i>
                        </div>
                    </div>
                   
                    <button class='btn btn-block'>Sign in</button>
                </form>
                
                
<!--                 <div class="alert alert-error" id="successmsg1" style="margin-top:15px;">
                    <a class="close" data-dismiss="alert" href="#">&times;</a>
                    <i class="icon-remove-sign"></i>
                    <b><span id="msg"></span></b>
                </div> -->
                
                
            </div>
        </div>
    </div>
    <div class='col-sm-12 navbar-fixed-bottom'
        style="text-align: center; color: #000; font-weight: bold; padding: 20px; background-color: #DEDEDE;">
          Tekskills India Pvt. Ltd.</div>
    <!-- / jquery -->
    <script
        src="resources/assets/javascripts/jquery/jquery.min.js"
        type="text/javascript"></script>
    <!-- / jquery mobile events (for touch and slide) -->
    <script
        src="resources/assets/javascripts/plugins/mobile_events/jquery.mobile-events.min.js"
        type="text/javascript"></script>
    <!-- / jquery migrate (for compatibility with new jquery) -->
    <script
        src="resources/assets/javascripts/jquery/jquery-migrate.min.js"
        type="text/javascript"></script>
    <!-- / jquery ui -->
    <script
        src="resources/assets/javascripts/jquery_ui/jquery-ui.min.js"
        type="text/javascript"></script>
    <!-- / jQuery UI Touch Punch -->
    <script
        src="resources/assets/javascripts/plugins/jquery_ui_touch_punch/jquery.ui.touch-punch.min.js"
        type="text/javascript"></script>
    <!-- / bootstrap -->
    <script
        src="resources/assets/javascripts/bootstrap/bootstrap.min.js"
        type="text/javascript"></script>
    <script
        src="resources/assets/javascripts/plugins/flot/excanvas.js"
        type="text/javascript"></script>
    <!-- / sparklines -->
    <script
        src="resources/assets/javascripts/plugins/sparklines/jquery.sparkline.min.js"
        type="text/javascript"></script>
    <!-- / flot charts -->
    <script
        src="resources/assets/javascripts/plugins/flot/flot.min.js"
        type="text/javascript"></script>
    <script
        src="resources/assets/javascripts/plugins/flot/flot.resize.js"
        type="text/javascript"></script>
    <script
        src="resources/assets/javascripts/plugins/flot/flot.pie.js"
        type="text/javascript"></script>
    <!-- / bootstrap switch -->
    <script
        src="resources/assets/javascripts/plugins/bootstrap_switch/bootstrapSwitch.min.js"
        type="text/javascript"></script>
    <!-- / fullcalendar -->
    <script
        src="resources/assets/javascripts/plugins/fullcalendar/fullcalendar.min.js"
        type="text/javascript"></script>
    <!-- / datatables -->
    <script
        src="resources/assets/javascripts/plugins/datatables/jquery.dataTables.min.js"
        type="text/javascript"></script>
    <script
        src="resources/assets/javascripts/plugins/datatables/jquery.dataTables.columnFilter.js"
        type="text/javascript"></script>
    <!-- / wysihtml5 -->
    <script
        src="resources/assets/javascripts/plugins/common/wysihtml5.min.js"
        type="text/javascript"></script>
    <script
        src="resources/assets/javascripts/plugins/common/bootstrap-wysihtml5.js"
        type="text/javascript"></script>
    <!-- / select2 -->
    <script
        src="resources/assets/javascripts/plugins/select2/select2.js"
        type="text/javascript"></script>
    <!-- / color picker -->
    <script
        src="resources/assets/javascripts/plugins/bootstrap_colorpicker/bootstrap-colorpicker.min.js"
        type="text/javascript"></script>
    <!-- / mention -->
    <script
        src="resources/assets/javascripts/plugins/mention/mention.min.js"
        type="text/javascript"></script>
    <!-- / input mask -->
    <script
        src="resources/assets/javascripts/plugins/input_mask/bootstrap-inputmask.min.js"
        type="text/javascript"></script>
    <!-- / fileinput -->
    <script
        src="resources/assets/javascripts/plugins/fileinput/bootstrap-fileinput.js"
        type="text/javascript"></script>
    <!-- / modernizr -->
    <script
        src="resources/assets/javascripts/plugins/modernizr/modernizr.min.js"
        type="text/javascript"></script>
    <!-- / retina -->
    <script
        src="resources/assets/javascripts/plugins/retina/retina.js"
        type="text/javascript"></script>
    <!-- / fileupload -->
    <script
        src="resources/assets/javascripts/plugins/fileupload/tmpl.min.js"
        type="text/javascript"></script>
    <script
        src="resources/assets/javascripts/plugins/fileupload/load-image.min.js"
        type="text/javascript"></script>
    <script
        src="resources/assets/javascripts/plugins/fileupload/canvas-to-blob.min.js"
        type="text/javascript"></script>
    <script
        src="resources/assets/javascripts/plugins/fileupload/jquery.iframe-transport.min.js"
        type="text/javascript"></script>
    <script
        src="resources/assets/javascripts/plugins/fileupload/jquery.fileupload.min.js"
        type="text/javascript"></script>
    <script
        src="resources/assets/javascripts/plugins/fileupload/jquery.fileupload-fp.min.js"
        type="text/javascript"></script>
    <script
        src="resources/assets/javascripts/plugins/fileupload/jquery.fileupload-ui.min.js"
        type="text/javascript"></script>
    <script
        src="resources/assets/javascripts/plugins/fileupload/jquery.fileupload-init.js"
        type="text/javascript"></script>
    <!-- / timeago -->
    <script
        src="resources/assets/javascripts/plugins/timeago/jquery.timeago.js"
        type="text/javascript"></script>
    <!-- / slimscroll -->
    <script
        src="resources/assets/javascripts/plugins/slimscroll/jquery.slimscroll.min.js"
        type="text/javascript"></script>
    <!-- / autosize (for textareas) -->
    <script
        src="resources/assets/javascripts/plugins/autosize/jquery.autosize-min.js"
        type="text/javascript"></script>
    <!-- / charCount -->
    <script
        src="resources/assets/javascripts/plugins/charCount/charCount.js"
        type="text/javascript"></script>
    <!-- / validate -->
    <script
        src="resources/assets/javascripts/plugins/validate/jquery.validate.min.js"
        type="text/javascript"></script>
    <script
        src="resources/assets/javascripts/plugins/validate/additional-methods.js"
        type="text/javascript"></script>
    <!-- / naked password -->
    <script
        src="resources/assets/javascripts/plugins/naked_password/naked_password-0.2.4.min.js"
        type="text/javascript"></script>
    <!-- / nestable -->
    <script
        src="resources/assets/javascripts/plugins/nestable/jquery.nestable.js"
        type="text/javascript"></script>
    <!-- / tabdrop -->
    <script
        src="resources/assets/javascripts/plugins/tabdrop/bootstrap-tabdrop.js"
        type="text/javascript"></script>
    <!-- / jgrowl -->
    <script
        src="resources/assets/javascripts/plugins/jgrowl/jquery.jgrowl.min.js"
        type="text/javascript"></script>
    <!-- / bootbox -->
    <script
        src="resources/assets/javascripts/plugins/bootbox/bootbox.min.js"
        type="text/javascript"></script>
    <!-- / inplace editing -->
    <script
        src="resources/assets/javascripts/plugins/xeditable/bootstrap-editable.min.js"
        type="text/javascript"></script>
    <script
        src="resources/assets/javascripts/plugins/xeditable/wysihtml5.js"
        type="text/javascript"></script>
    <!-- / ckeditor -->
    <script
        src="resources/assets/javascripts/plugins/ckeditor/ckeditor.js"
        type="text/javascript"></script>
    <!-- / filetrees -->
    <script
        src="resources/assets/javascripts/plugins/dynatree/jquery.dynatree.min.js"
        type="text/javascript"></script>
    <!-- / datetime picker -->
    <script
        src="resources/assets/javascripts/plugins/bootstrap_datetimepicker/bootstrap-datetimepicker.js"
        type="text/javascript"></script>
    <!-- / daterange picker -->
    <script
        src="resources/assets/javascripts/plugins/bootstrap_daterangepicker/moment.min.js"
        type="text/javascript"></script>
    <script
        src="resources/assets/javascripts/plugins/bootstrap_daterangepicker/bootstrap-daterangepicker.js"
        type="text/javascript"></script>
    <!-- / max length -->
    <script
        src="resources/assets/javascripts/plugins/bootstrap_maxlength/bootstrap-maxlength.min.js"
        type="text/javascript"></script>
    <!-- / dropdown hover -->
    <script
        src="resources/assets/javascripts/plugins/bootstrap_hover_dropdown/twitter-bootstrap-hover-dropdown.min.js"
        type="text/javascript"></script>
    <!-- / slider nav (address book) -->
    <script
        src="resources/assets/javascripts/plugins/slider_nav/slidernav-min.js"
        type="text/javascript"></script>
    <!-- / fuelux -->
    <script
        src="resources/assets/javascripts/plugins/fuelux/wizard.js"
        type="text/javascript"></script>
    <!-- / flatty theme [required files] -->
    <script src="resources/assets/javascripts/nav.js"
        type="text/javascript"></script>
    <!-- / flatty theme -->
    <script src="resources/assets/javascripts/tables.js"
        type="text/javascript"></script>
    <script src="resources/assets/javascripts/theme.js"
        type="text/javascript"></script>
    <!-- / demo -->
    <script
        src="resources/assets/javascripts/demo/jquery.mockjax.js"
        type="text/javascript"></script>
    <script
        src="resources/assets/javascripts/demo/inplace_editing.js"
        type="text/javascript"></script>
    <script
        src="resources/assets/javascripts/demo/charts.js"
        type="text/javascript"></script>
    <script
        src="resources/assets/javascripts/demo/demo.js"
        type="text/javascript"></script>
    
    <!-- <script type="text/javascript">
        $( document ).ready(function() {
             if(window.location.href.indexOf("error=Invalid+Credentials") > -1) {
                   //$('#successmsg1').text("Incorrect UserName And Password");
                     $('#msg').val(error);
                   $('#successmsg1').delay(1).fadeIn();
                   $('#successmsg1').delay(2500).fadeOut();
                } 
             if(window.location.href.indexOf("sessionmsg=Session+Expired") > -1) {
                 //$('#successmsg1').text("Incorrect UserName And Password");
                 $('#msg').val(sessionmsg);
                 $('#successmsg1').delay(1).fadeIn();
                 $('#successmsg1').delay(2500).fadeOut();
              } 
        });
    </script> -->
         <script>
		history.pushState(null, document.title, location.href);
		window.addEventListener('popstate',function(event){
		history.pushState(null,document.title, location.href);
		});
</script>   
        
</body>
</html>
