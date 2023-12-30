import { Service, Utils } from '../imports.js'

class IndicatorService extends Service {
  static { Service.register(this, { 'popup': ['double'] }) }

  _count = 0
  _delay = 1500

  popup(value) {
    this.emit('popup', value)
    this._count++
    Utils.timeout(this._delay, () => {
      this._count--

      if (this._count === 0) this.emit('popup', -1)
    })
  }

  connectWidget(widget, callback) {
    connect(this, widget, callback, 'popup')
  }
}

// the singleton instance
const service = new IndicatorService()

// make it global for easy use with cli
globalThis['indicator'] = service

// export to use in other modules
export default service