{Disposable} = require 'atom'
path = require 'path'

element_name = 'waka-status-bar' + Date.now()

svg = """
<svg id="wakatime-svg" width="18px" height="18px" viewBox="0 0 256 256" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" preserveAspectRatio="xMidYMid">
<g><path d="M128,0 C57.308,0 0,57.308 0,128 C0,198.693 57.308,256 128,256 C198.693,256 256,198.693 256,128 C256,57.308 198.693,0 128,0 M128,33.805 C179.939,33.805 222.195,76.061 222.195,128 C222.195,179.94 179.939,222.195 128,222.195 C76.061,222.195 33.805,179.94 33.805,128 C33.805,76.061 76.061,33.805 128,33.805 M115.4993,155.6431 L115.3873,155.6431 C113.4353,155.6081 111.6083,154.6751 110.4343,153.1151 L81.5593,114.7321 C79.4553,111.9351 80.0173,107.9611 82.8143,105.8561 C85.6123,103.7511 89.5853,104.3131 91.6903,107.1111 L115.6833,139.0051 L122.5463,130.5271 C123.7493,129.0411 125.5603,128.1771 127.4723,128.1771 L127.4803,128.1771 C129.3973,128.1791 131.2093,129.0471 132.4103,130.5411 L139.0003,138.7281 L176.6923,90.1341 C178.8353,87.3681 182.8173,86.8651 185.5843,89.0111 C188.3493,91.1561 188.8533,95.1371 186.7073,97.9041 L144.1003,152.8371 C142.9143,154.3681 141.0883,155.2721 139.1503,155.2901 L139.0933,155.2901 C137.1743,155.2901 135.3583,154.4221 134.1553,152.9261 L127.4583,144.6071 L120.4253,153.2931 C119.2213,154.7811 117.4103,155.6431 115.4993,155.6431" fill="#000000"></path></g>
</svg>
"""
class StatusBarTileView extends HTMLElement

  init: ->
    @link = document.createElement('a')
    @link.classList.add('inline-block')
    @link.href = 'https://wakatime.com/'
    @appendChild @link

    @icon = document.createElement('div')
    @icon.setAttribute('id', 'wakatime-status-bar')
    @icon.classList.add('inline-block')
    @icon.innerHTML = svg
    @link.appendChild @icon

    @msg = document.createElement('span')
    @msg.classList.add('inline-block')
    @link.appendChild @msg

    @setStatus "initializing..."

  show: ->
    @classList.add(element_name, 'inline-block')
    @classList.remove(element_name, 'hidden')

  hide: ->
    @classList.remove(element_name, 'inline-block')
    @classList.add(element_name, 'hidden')

  destroy: ->
    @tooltip?.dispose()
    @classList = ''

  setStatus: (content, override_errors = true) ->
    if override_errors or /^error/i.test(@msg?.textContent or '')
      @msg?.textContent = content or ''

  setTitle: (text) ->
    @tooltip?.dispose()
    @tooltip = atom.tooltips.add this,
      title: text

module.exports = document.registerElement(element_name, prototype: StatusBarTileView.prototype, extends: 'div')
