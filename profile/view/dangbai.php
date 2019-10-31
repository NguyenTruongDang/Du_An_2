
									<div class="bot-proview">
										<p>
											Đăng tin
										</p>
									</div>
									<div class="all-about">
										<form>
											<div class="form-group">
												<label for="exampleFormControlInput1">Tiêu đề bài viết</label>
												<input type="text" class="form-control" id="exampleFormControlInput1">
											</div>
											<div class="form-group">
												<label for="exampleFormControlTextarea1">Mô tả</label>
												<textarea class="form-control" id="exampleFormControlTextarea1"
													rows="3"></textarea>
											</div>
											<div class="form-group">
												<label for="exampleFormControlTextarea1">Nôi dung</label>
												<textarea id="content" name="content" rows="14" class="form-control" id="desc"></textarea>
													<script>    CKEDITOR.replace( 'content' ); </script>
											</div>
											<div class="form-group">
												<div class="custom-control custom-radio">
													<input type="radio" class="custom-control-input" id="customRadio"
														name="example" value="customEx">
													<label class="custom-control-label" for="customRadio">Custom radio
														1</label>
												</div>
												<div class="custom-control custom-radio">
													<input type="radio" class="custom-control-input" id="customRadio2"
														name="example" value="customEx">
													<label class="custom-control-label" for="customRadio2">Custom radio
														2</label>
												</div>
												<div class="col-auto my-1">
													<label class="mr-sm-2"
														for="inlineFormCustomSelect">Lựa chọn: </label>
													<select class="custom-select mr-sm-2" id="inlineFormCustomSelect">
														<option selected>Lựa chọn....</option>
														<option value="1">1</option>
														<option value="2">2</option>
														<option value="3">3</option>
													</select>
												</div>
											</div>
											<button type="button" class="btn btn-primary">Đăng bài</button>
										</form>
									</div>

