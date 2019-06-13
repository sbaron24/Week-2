button = document.getElementById('random-button')
let fetchArticle = (event) => {
  fetch('/api/v1/articles.json')
  .then(response => {
    if (response.ok) {
      return response
    } else {
      let error = new Error('Something went wrong with GET response!')
      throw(error)
    }
  })
  .then(response => response.json())
  .then(body => {
    title = `<h3> ${body['title']} </h3>`
    description = `<p> ${body['description']} </p>`
    url = `<a href= "${body['url']}" target="_blank" > ${body['url']} </a>`
    innerHTMLString = `${title}\n${description}\n${url}`
    articleDiv = document.getElementsByClassName('article')[0]
    articleDiv.innerHTML += innerHTMLString
  })
}

button.addEventListener('click', fetchArticle)
