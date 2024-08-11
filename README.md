# BOII Development - Hunting

## 🌍 Overview

Introducing BOII Hunting! 

This script was built as a complete overhaul and replacement for the existing QB only hunting resource. 
Just a straight forward hunting activity that works off native animal spawns instead of a bait system. 

There is plans to add some additional features to this down the line but for now the priority was code clean up and multi framework compatibility.

Enjoy!

## 🌐 Features

**Multi-Framework Compatibility:** Works with multiple frameworks out of the box, any frameworks not covered can be added into boii_utils.
**Customizable UI:** Clean and simple UI with customizable root CSS files for easy theming and adjustments.
**Multiple Store Locations:** Each store type can support multiple locations. The config allows for easy addition of new store types, making the script highly extensible.
**In Built Progress Timer:** A progress circle timer has replaced progressbar. This keeps the resource closer to standalone, minimizing dependencies.

## 💹 Dependencies

- **boii_utils:** For multi-framework compatibility.
- **boii_ui:** Optional, required for dialogue system if using.
- **boii_target | ox_target | qb-target:** A target resource, you can use `boii_target`, `ox_target`, or `qb-target`.

## 📦 Installation

### Prerequisites

- Downloading `boii_utils`:

1. Download the utility library from one of our platforms; 

- https://github.com/boiidevelopment/boii_utils
- https://boiidevelopment.tebex.io/package/5972340

2. Edit `server/config.lua`:

- Set your notifications choice under `config.ui.notify`
- For licence restricting items make sure you have added the licence into `config.licences`

Any other changes to the configs you wish to make can also be made.

### Script installation

1. Customisation:

- Customise `server/config.lua` to complete the store and item configs specific to your server
- Language can be changed in `shared/language/en.lua` or you can create a new language file and change the line `'shared/language/en.lua'` to your new language file
- UI colour palette can be changed within `public/css/root.css` to preview the UI in a web browser you can uncomment the code at the bottom of `public/classes/stores.js` or `public/classes/timer.js` then open the `index.html` file
- Any items added the images for these should be added into `public/assets/images`

2. Installation:

- Drag and drop `boii_hunting` into your server resources
- Add `ensure boii_hunting` into your `server.cfg` ensuring it is placed after `boii_utils`

## 📝 Notes

-> Documentation has not yet been completed, this will be done in due course.

## 📝 Documentation

[Documentation](https://docs.boii.dev/fivem-resources/paid-resources/boii_hunting)

## 📹 Preview

[YouTube](https://www.youtube.com/watch?v=xeNtH5GQc4o)

## 📩 Support

[Discord](https://discord.gg/boiidevelopment)
