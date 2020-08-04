$(document).on('turbolinks:load', ()=> {
  function buildHTML(comment){
    if (comment.user_id === comment.ranking_id) {
      let html =
      `<div class='commentBox__index__box'>
        <span class='commentBox__index__box--name'>${comment.user_name}</span>
        <span class='commentBox__index__box--send'>投稿者</span>
        <span class='commentBox__index__box--date'>${comment.created_at}</span>
        <p class='commentBox__index__box--text'>${comment.text}</p>
      </div>`
      return html;
    } else {
      let html =
      `<div class='commentBox__index__box'>
        <span class='commentBox__index__box--name'>${comment.user_name}</span>
        <span class='commentBox__index__box--date'>${comment.created_at}</span>
        <p class='commentBox__index__box--text'>${comment.text}</p>
      </div>`
      return html;
    }
  }
  $('#new_comment').on('submit', function(e){
    e.preventDefault();
    let formData = new FormData(this);
    let url = $(this).attr('action')
    $.ajax({
      url: url,
      type: "POST",
      data: formData,
      dataType: 'json',
      processData: false,
      contentType: false
    })
    .done(function(data){
      let html = buildHTML(data);
      $('.commentBox__index').append(html);
      $('.commentBox__text').val('');
      $('.commentBox__index').animate({ scrollTop: $('.commentBox__index')[0].scrollHeight});
      $('.commentBox__submit').prop('disabled', false);
    })
    .fail(function(){
      alert('コメントを入力してください');
    })
  })

  $('.commentBox__head').on('click', function(e){
    e.preventDefault();
    $('.commentBox__index').animate({scrollTop:0});
  })
})
