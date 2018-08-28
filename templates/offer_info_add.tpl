<link rel="stylesheet" href="/organizer/css/style.css">
<div class="back_img">
<form class='form-horizontal' action=$SELF_URL method='get' id='offer_info_form' name='offer_info_form' role='form'>
  <input type=hidden name=index value=$index>
  <input type=hidden name=ID value='%ID%'>
  <input type=hidden name=offer_info value=%OFFER_INFO%>
  <fieldset>
    <div class='box box-form'>
      <div class='box-header with-border'>
        <h4 class='box-title'>_{INFO}_</h4>
        <span class='pull-right'></span>
      </div>
      <div class='box-body'>
        <div class='form-group'>
          <label class='control-label col-md-3 text-left'  for='SERVICE_NAME'>_{SERVICE_NAME}_</label>
          <div class='col-md-9'>
            <input id='SERVICE_NAME' name='SERVICE_NAME' value='%SERVICE_NAME%' class='form-control' type='text' autocomplete="off" required>
          </div>
        </div>
        <div class='form-group' >
          <label class='control-label col-md-3 text-left'  for='HEADER_NAME'>_{SECTION}_</label>
          <div class='col-md-9'>
            %SERVICE_SELECT%       
          </div>
        </div>
          <div class='form-group'>
          <label class='control-label col-md-3 text-left'  for='DESCRIPTION'>_{DESCRIPTION}_</label>
          <div class='col-md-9'>
            <input id='DESCRIPTION' name='DESCRIPTION' value='%DESCRIPTION%' class='form-control' type='text' autocomplete="off" required>
          </div>
        </div>
          <div class='form-group'>
          <label class='control-label col-md-3 text-left'  for='ADDRESS'>_{ADDRESS}_</label>
          <div class='col-md-9'>
            <input id='ADDRESS' name='ADDRESS' value='%ADDRESS%' class='form-control' type='text' autocomplete="off" required>
          </div>
        </div>
          <div class='form-group'>
          <label class='control-label col-md-3 text-left'  for='AVR_TIME'>_{AVR_TIME}_</label>
          <div class='col-md-9'>
            <input id='AVR_TIME' name='AVR_TIME' value='%AVR_TIME%' class='form-control' type='text' autocomplete="off" required>
          </div>
        </div>
          <div class='form-group'>
          <label class='control-label col-md-3 text-left'  for='IMAGE'>_{IMAGE}_</label>
          <div class='col-md-9'>
            <input id='IMAGE' name='IMAGE' value='%IMAGE%' class='form-control' type='text' autocomplete="off" required>
          </div>
        </div>  
         <div class='form-group'>
          <label class='control-label col-md-3 text-left'  for='TIME_START'>_{TIME_START}_</label>
          <div class='col-md-9'>
            <input id='TIME_START' name='TIME_START' value='%TIME_START%' class='form-control' type='time' autocomplete="off" required>
          </div>
        </div> 
         <div class='form-group'>
          <label class='control-label col-md-3 text-left'  for='TIME_FINISH'>_{TIME_FINISH}_</label>
          <div class='col-md-9'>
            <input id='TIME_FINISH' name='TIME_FINISH' value='%TIME_FINISH%' class='form-control' type='time' autocomplete="off" required>
          </div>
        </div> 
         <div class='form-group'>
          <label class='control-label col-md-3 text-left'  for='LAT'>_{LAT}_</label>
          <div class='col-md-9'>
            <input id='LAT' name='LAT' value='%LAT%' class='form-control' type='text' autocomplete="off" required>
          </div>
        </div> 
         <div class='form-group'>
          <label class='control-label col-md-3 text-left'  for='LNG'>_{LNG}_</label>
          <div class='col-md-9'>
            <input id='LNG' name='LNG' value='%LNG%' class='form-control' type='text' autocomplete="off" required>
          </div>
        </div>
            <div class='form-group'>
          <label class='control-label col-md-3 text-left'  for='START_DATE'>_{START_DATE}_</label>
          <div class='col-md-9'>
            <input id='START_DATE' name='START_DATE' value='%START_DATE%' class='form-control' type='date' autocomplete="off" >
          </div>
        </div>
            <div class='form-group'>
          <label class='control-label col-md-3 text-left'  for='FINISH_DATE'>_{FINISH_DATE}_</label>
          <div class='col-md-9'>
            <input id='FINISH_DATE' name='FINISH_DATE' value='%FINISH_DATE%' class='form-control' type='date' autocomplete="off" >
          </div>
        </div> 
      </div>
      <div class='box-footer'>
          <input type=submit name=%ACTION% value='%LNG_ACTION%' class="btn btn-primary" >
          <a class="btn btn-primary" href="/organizer.cgi" role="button">_{GO_BACK}_</a>
      </div>
    </div>
  </fieldset>
</form>
</div>