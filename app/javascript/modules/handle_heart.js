// import $ from 'jquery'
// import axios from 'modules/axios'

// const id = $('.post_like').attr('id')
// const active = $(`.active-heart-${id}`)
// const inactive = $(`.inactive-heart-${id}`)

// const listenInactiveHeartEvent = (postId) => {
//   $(inactive).on('click', () => {
//     axios.post(`/posts/${postId}/like`)
//       .then((response) => {
//         if (response.data.status === 'ok') {
//           $(active).removeClass('hidden')
//           $(inactive).addClass('hidden')
//         }
//       })
//       .catch((e) => {
//         window.alert('Error')
//         console.log(e)
//       })
//     })
// }

// const listenActiveHeartEvent = (postId) => {
//   $(active).on('click', () => {
//     axios.delete(`/posts/${postId}/like`)
//       .then((response) => {
//         if (response.data.status === 'ok') {
//           $(active).addClass('hidden')
//           $(inactive).removeClass('hidden')
//         }
//       })
//       .catch((e) => {
//         window.alert('Error')
//         console.log(e)
//       })
//     })
// }

// export {
//   listenInactiveHeartEvent,
//   listenActiveHeartEvent
// }