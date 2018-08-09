<form class='form-horizontal' action=$SELF_URL method='get' id='info_form' name='info_form' role='form'>
  <input type=hidden name=index value=$index>
  <input type=hidden name=ID value='%ID%'>
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
      </div>
      <div class='box-footer'>
        <input type=submit name=%ACTION% value='%LNG_ACTION%' class="btn btn-primary" >
      </div>
    </div>
  </fieldset>
</form>
