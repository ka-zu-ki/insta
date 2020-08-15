import $ from 'jquery'
import axios from 'modules/axios'
import {
  listenInactiveHeartEvent,
  listenActiveHeartEvent
} from 'modules/handle_heart'

const handleHeartDisplay = (hasLiked) => {
  if (hasLiked) {
    $('.active-heart').removeClass('hidden')
  } else {
    $('.inactive-heart').removeClass('hidden')
  }
}



document.addEventListener('turbolinks:load', () => {
  $('.profile_avatar').on('click', () => {
    $('.profile_avatar_edit').removeClass('hidden')
    $('profile_avatar').addClass('hidden')
  })

  function readURL(input) {
    if (input.files && input.files[0]) {
      var reader = new FileReader();
      
      reader.onload = function (e) {
        $('#avatar_img_prev').attr('src', e.target.result);
      }
      reader.readAsDataURL(input.files[0]);
    }
  }
 
  $("#post_img").change(function(){
    $('#avatar_img_prev').removeClass('hidden');
    $('.avatar_present_img').remove();
    readURL(this);
  });

  const dataset = $('#post-id').data()
  const postId = dataset.postId

  axios.get(`/posts/${postId}/like`)
    .then((response) => {
      const hasLiked = response.data.hasLiked
      handleHeartDisplay(hasLiked)
    })

  listenInactiveHeartEvent(postId)
  listenActiveHeartEvent(postId)

  const commentId = dataset.commentId

  axios.get(`/posts/${postId}/comments/${commentId}`)
    .then((response) => {
      const comment = response.data
      $('.comments-container').append(
        `<div class="post_comment"><p>${comment.content}</p></div>`,
        // `<div class="post_comment_name"><p>${comment.user.name}</p></div>`
      )
    })
})