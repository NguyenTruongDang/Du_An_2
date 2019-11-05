<div class="right-baiviet">
  <h1>Cài đặt tài khoản </h1>
  <form class="form-horizontal" method="POST">
    <div class="form-group">
      <label class="control-label col-sm-3" for="text">Tên tài khoản :</label>
      <div class="col-sm-9">
        <input type="text" name="ten" value="<?= $data->ten ?>" class="form-control" id="text" placeholder="Enter text">
      </div>
    </div>
    <div class="form-group">
      <label class="control-label col-sm-3" for="text">Email :</label>
      <div class="col-sm-9">
        <input type="text" name="mail" value="<?= $data->mail ?>" class="form-control" id="text" placeholder="Enter text">
      </div>
    </div>
    <div class="form-group">
      <label class="control-label col-sm-3" for="text">Số điện thoại :</label>
      <div class="col-sm-9">
        <input type="text" name="sdt" value="<?= $data->sdt ?>" class="form-control" id="text" placeholder="Enter text">
      </div>
    </div>

    <div class="form-group">
      <div class="col-sm-offset-3 col-sm-9">
        <button type="submit" name="sm" class="btn btn-default">Chỉnh sửa</button>
      </div>
    </div>
  </form>

  <div class="row">
    <div class="col-md-12">
      <div class="bot-proview">
        <a href="#home" id="chuyenabout">Đổi mật khẩu</a>
        <button type="button" class="btn btn-secondary" id="clickbutton">Secondary</button>
      </div>
      <div class="all-about">
        <div class="changepass-container">
          <div class="row borderne">
            <div class="col-md-12 changepass-form-1">
              <h3>Thay đổi mật khẩu</h3>
              <form>
                <div class="form-group row">
                  <label for="exampleInputPassword1" class="col-md-4 col-form-label">Mật khẩu hiện tại:</label>
                  <div class="col-md-8">
                    <input type="password" class="form-control" value="" />
                  </div>
                </div>
                <div class="form-group row">
                  <label for="exampleInputPassword2" class="col-md-4 col-form-label">Mật khẩu mới:</label>
                  <div class="col-md-8">
                    <input type="password" class="form-control" value="" />
                  </div>
                </div>
                <div class="form-group row">
                  <label for="exampleInputPassword3" class="col-md-4 col-form-label">Nhập lại mật khẩu mới:</label>
                  <div class="col-md-8">
                    <input type="password" class="form-control" value="" />
                  </div>
                </div>
                <div class="form-group">
                  <input type="submit" class="btnSubmit" value="Lưu thay đổi" />
                </div>
              </form>
            </div>
          </div>
        </div>

      </div>
    </div>

  </div>


</div>