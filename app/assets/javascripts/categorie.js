$(function(){
  // 子カテゴリー追加処理
  function buildChildHTML(child){
    var html = `<a class= "child_category" id="${child.id}"
                href="#">${child.name}</a>`;
    return html;   
  }
  // 選択していた色を初期値に戻します
  $(document).on('mouseleave', '.list-left__choice__list', function(){
    $(".parent_category").css("background-color","").css("color", "");
  })
  // 「すべて」にマウスが乗った時に親カテゴリーの色を初期に戻します
  $(document).on('mouseover', '.category-list__link', function(){
    $(".parent_category").css("background-color","").css("color", "");
  })
  // 子カテゴリー取得発火処理
  $(".parent_category").on("mouseover", function(){
    var id = this.id  //  マウスが乗った親のIDを取得してます
    $(".parent_category").css("background-color","").css("color", "");
    $(this).css("background-color", "rgb(253, 86, 86)").css("color", "#ffffff");
    $(".child_category").remove();  // 選択してない、子を消します
    $(".grand_child_category").remove();  // 選択してない、孫を消します
    $.ajax({
      type: 'GET',
      url: '/categories/new', // とりあえず、NEWアクションに飛ばしてます
      data: {parent_id: id},
      dataType: 'json'
    }).done(function(children){ // 返ってきた子の記述をリストの最後尾に追加
      children.forEach(function(child){
        var html = buildChildHTML(child);
        $(".children-list").append(html);
      });
    });
  });
  
  // 孫のカテゴリー追加処理
  function buildGrandChildHTML(child){
    var html =`<a class= "grand_child_category" id="${child.id}"
              href="#">${child.name}</a>`;
    return html;
  }
  // 孫カテゴリー取得発火処理
  $(document).on("mouseover",".child_category", function(){
    var id = this.id
    $(".child_category").css("background-color","").css("color", "");
    $(this).css("background-color", "rgb(253, 86, 86)").css("color", "#ffffff");
    $.ajax({
      type: 'GET',
      url: '/categories/new',
      data: {parent_id: id},
      dataType: 'json'
    }).done(function(children){
      children.forEach(function(child){
        var html = buildGrandChildHTML(child);
        $(".grand_children-list").append(html);
      })
      $(document).on("mouseover",".child_category", function(){
        $(".grand_child_category").remove();
      });
    });
  });
});

