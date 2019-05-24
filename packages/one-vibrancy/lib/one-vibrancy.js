'use babel';

export default {

  activate(state) {
    // Observe config
    atom.config.observe('one-vibrancy.effect', (value) => {
      this.setEffect();
    })

    // React to theme changes
    atom.config.onDidChange('core.themes', (value) => {
      this.setEffect();
    })
  },

  setEffect() {
    let effect = atom.config.get('one-vibrancy.effect');

    // Automatically switch based on if the theme is light or dark
    if (effect == 'auto') {
      let currentThemes = atom.config.get('core.themes').join(' ');
      if ( currentThemes.includes('light-ui') ) {
        this.activateVibrancyEffect('medium-light');
      } else {
        this.activateVibrancyEffect('dark');
      }

    // Otherwise use the config value
    } else if (effect == 'auto-opaque') {
      let currentThemes = atom.config.get('core.themes').join(' ');
      if ( currentThemes.includes('light-ui') ) {
        this.activateVibrancyEffect('light');
      } else {
        this.activateVibrancyEffect('ultra-dark');
      }

    // Otherwise use the config value
    } else {
      this.activateVibrancyEffect(effect);
    }

    // Enable styling
    document.documentElement.classList.add('one-vibrancy');
  },

  activateVibrancyEffect(effect) {
    try {
      require('electron').remote.getCurrentWindow().setVibrancy(effect);
      // require('electron').remote.getCurrentWindow().setBackgroundColor('#00000000');
    }
    catch(error){
      console.error('Vibrancy Error', error);
    }
  },

  deactivate() {
    document.documentElement.classList.remove('one-vibrancy');
    require('electron').remote.getCurrentWindow().setVibrancy();
  }

};
