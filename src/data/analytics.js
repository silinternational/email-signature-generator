init()

// https://developers.google.com/analytics/devguides/collection/analyticsjs
function init() {
  loadLib()
  
  window.ga=window.ga||function(){(ga.q=ga.q||[]).push(arguments)}
  ga.l=+new Date

  ga('create', process.env.GOOGLE_ANALYTICS_ID, 'auto')
  ga('send', 'pageview')
}

function loadLib() {
  const el = document.createElement('script')

  el.src = 'https://www.google-analytics.com/analytics.js'
  el.async = true
  
  document.head.appendChild(el)
}
