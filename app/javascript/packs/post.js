import $ from 'jquery'
import axios from 'modules/axios'
import {
  listenInactiveHeartEvent,
  listenActiveHeartEvent
} from 'modules/handle_heart'

// const handleHeartDisplay = (hasLiked) => {
//   const id = $('.post_like').attr('id')
//   const active = $(`.active-heart-${id}`)
//   const inactive = $(`.inactive-heart-${id}`)

//   if (hasLiked) {
//     $(active).removeClass('hidden')
//   } else {
//     $(inactive).removeClass('hidden')
//   }
// }

const appendNewComment = (comment) => {
  $('.comments-container').append(
    `<div class="post_comment"><p>${comment.content}</p></div>`,
    `<div class="post_comment_name"><p>${comment.user.name}</p></div>`
  )
}

const handleCommentForm = () => {
  $('.show-comment-form').on('click', () => {
    $('.show-comment-form').addClass('hidden')
    $('.comment-text-area').removeClass('hidden')
  })
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

  // axios.get(`/posts/${postId}/like`)
  //   .then((response) => {
  //     const hasLiked = response.data.hasLiked
  //     handleHeartDisplay(hasLiked)
  //   })

  
  // listenInactiveHeartEvent(postId)
  // listenActiveHeartEvent(postId)

  axios.get(`/posts/${postId}/comments/index_json`)
    .then((response) => {
      const comments = response.data
      comments.forEach((comment) => {
        appendNewComment (comment)
      })
    })

    handleCommentForm()

  $('.add-comment-button').on('click', () => {
    const content = $('#comment_content').val()
    if (!content) {
      window.alert('コメントを入力してください')
    } else {
      axios.post(`/posts/${postId}/comments`, {
        comment: {content: content}
      })
        .then((res) => {
          const comment = res.data
          appendNewComment (comment)
          $('#comment_content').val('')
        })
    }
  })
})