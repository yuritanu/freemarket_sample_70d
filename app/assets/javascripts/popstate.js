// $(function(){
//   if(document.URL.match("deliveryaddresses")){
//     (window).on('popstate',function(){
//       console.log('ボタンがクリックされました')
//     })
//   }
// });
// $(function(){
//   if(document.URL.match("users.user")){
//     (window).on('popstate',function(){
//       console.log('ボタンがクリックされました')
//     });
//   }
// });
// $(function(){
//   if(document.URL.match("profileaddresses")){
//     (window).on('popstate',function(){
//       console.log('ボタンがクリックされました')
//     });
//   }
// });

$(function(){
  (window).on('popstate',function(){
    if(document.URL.match("users.user")){
      console.log('ボタンがクリックされました')
    }
  });
});
$(function(){
  (window).on('popstate',function(){
    if(document.URL.match("profileaddresses")){
      console.log('ボタンがクリックされました')
    }
  });
});


