$(document).ready(function(){
  const priceInput = '#form__price-input';
  const feeFeild = '#form__fee';
  const profitFeild = '#form__profit';

  // 価格入力時に手数料、利益計算
  $(priceInput).on('keyup', function(){
    let input = $(this).val();
    if (input >= 300 && input <= 9999999){
      let fee = Math.floor(input * 0.1);
      let profit = "¥" + (input - fee).toLocaleString();
      $(feeFeild).html("¥" + fee.toLocaleString());
      $(profitFeild).html(profit);
    } else {
      let fee = '-';
      let profit = '-';
      $(feeFeild).html(fee);
      $(profitFeild).html(profit);
    }
  });

  // 編集時の手数料、利益計算
  $(priceInput).ready(function(){
    let input = $(priceInput).val();
    if (input >= 300 && input <= 9999999){
      let fee = Math.floor(input * 0.1);
      let profit = "¥" + (input - fee).toLocaleString();
      $(feeFeild).html("¥" + fee.toLocaleString());
      $(profitFeild).html(profit);
    } else {
      let fee = '-';
      let profit = '-';
      $(feeFeild).html(fee);
      $(profitFeild).html(profit);
    }
  });
});



// #画像アップロード
$(function(){
  let nextInput = function(index) {
    let html = `<label class="input_box">
                    <div class="input_box__upload" data-index="${index}">
                      <input class="input_box__upload__field" type="file" name="product[images_attributes][${index}][image]" id="product_images_attributes_${index}_image">
                      <i class="fas fa-camera fa-2x"></i>
                      <input name="product[item_imgs][_destroy]" type="hidden" value="${index}">
                      <input class="hidden-destroy" data-index="${index}" type="checkbox" value="${index}" name="product[item_imgs][_destroy]" id="product_item_imgs__destroy">
                    </div>
                </label>`;
    return html;
  }


  let previewImages = function(index, url) {
    let html = `<div class="previews__image">
                  <div class="previews__image__box">
                    <img data-image="{index:${index}}" src="${url}" width="100" height="100"></div>
                  <div class="previews__image__btn" data-btn-index="${index}">削除する</div>
                </div>`;
    return html;
  }


  let fileIndex = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39];
  lastIndex = $('.input_box__upload:last').data('index');
  fileIndex.splice(0, lastIndex);

  let resetcunt = $('.input_box__upload').length;
  if (resetcunt == 1) {
  } else if (resetcunt >= 10) {
    $('.input_box').addClass("resetcunt");
  } else if (resetcunt < 10) {
    $('.input_box').addClass("resetcunt");
    $('.showing__images__file').append(nextInput(fileIndex[0]));
  }

  
  $('.showing__images__file').on('change', '.input_box__upload', function(e){
    let targetIndex = $(this).data('index');
    let file = e.target.files[0];
    let blobUrl = window.URL.createObjectURL(file);
    let preview_count = $('.previews__image').length;

    if (img = $(`img[data-index="${targetIndex}"]`)[0]) {
      img.setAttribute('src', blobUrl);
    } else { 
      $('.previews').prepend(previewImages(targetIndex, blobUrl));
      fileIndex.shift();
      fileIndex.push(fileIndex[fileIndex.length - 1] + 1);

      if (preview_count == 9) {
        // $('.input_box').removeClass('input_box');
        $('.input_box').addClass('resetcunt');
        $('.fas').removeClass('fas');
        $('.fa-camera').removeClass('fa-camera');  
      } else {
        $('.input_box').removeClass('input_box');
        $('.fas').removeClass('fas');
        $('.fa-camera').removeClass('fa-camera');
        $('.showing__images__file').append(nextInput(fileIndex[0]));
      }
    }
  });


  $('.showing__images__file').on('click', '.previews__image__btn', function(){
    let targetIndex = $(this).data('btn-index');
    // $(`div[data-index="${targetIndex}"].input_box__upload`).parent().remove();
    $(this).parent().remove();
    let hiddenCheck = $(`input[data-index="${targetIndex}"].hidden-destroy`);
    hiddenCheck.prop('checked', true)
    if ($('.input_box').length == 0) $('.showing__images__file').append(nextInput(fileIndex[0]));
    // let cunt = $('.previews__image').length
    // console.log(cunt);
    if ($('.previews__image').length == 9) $('.showing__images__file').append(nextInput(fileIndex[0]));
  });
}); 
