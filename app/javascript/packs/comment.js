import $ from 'jquery'
import axios from 'modules/axios'

const dataset = $('#post-id').data()
const postId = dataset.postId
const commentId = dataset.commentId

document.addEventListener('turbolinks:load', () => {
  axios.get(`/posts/${postId}/comments/${commentId}`)
    .then((response) => {
      const comment = response.data
      $('.comments-container').(
        `<div class="post_comment"><p>${comment.content}</p></div>`,
        // `<div class="post_comment_name"><p>${comment.user.name}</p></div>`
      )
    })
})