# Learnings

This widget served as a practical introduction to developing with the [Garmin Connect IQ SDK](https://developer.garmin.com/connect-iq/overview/). Here are some notes and insights I gathered during the process.

## Get the Garmin Connect IQ SDK

Follow the steps `Install the SDK Manager` and `Installing the Visual Studio Code Monkey C Extension` in [Get the SDK](https://developer.garmin.com/connect-iq/sdk/).

## Samples

Use the `Monkey C: Open Samples Folder` in VS Code to check samples to different topics.

## Connect IQ Device Simulator

- Start via `Run > Start Debugging` (F5)
- Create `.vscode/launch.json` (e.g. via VS Code Activity Bar `Run Debug` menu) then you will be prompted for a device every time you run your project.
- Add product to the [`./manifest.xml`](./manifest.xml)
- Documentatin for different devices and screens:
  - https://developer.garmin.com/connect-iq/compatible-devices/
  - https://developer.garmin.com/connect-iq/core-topics/build-configuration/

## Internationalization (i18n)

- Check sample `Strings`
- Lanuage codes, three letters: [ISO 639-2 Code](https://www.loc.gov/standards/iso639-2/php/code_list.php)
- Add `resources-<LANGUAGE>/strings.xml`
- Add languag in `manifest.xml`
- Simulator: Chage via `Settings > Language`
- Also see the [build configurations](https://developer.garmin.com/connect-iq/core-topics/build-configuration/) for Localization Qualifiers

## Properties / Settings

- Implemented by using [`./resources/properties.xml`](./resources/properties.xml) and [`./resources/settings.xml`](./resources/settings.xml)
- Change in Connect IQ Device Simulator via: `File > Edit Persistent Storage > Edit Application.Properties data`
- Documentation: https://developer.garmin.com/connect-iq/core-topics/properties-and-app-settings/

## Publish a new version

In VS Code with the Monkey C extension installed:

1. Open the Command Palette: `Cmd + Shift + P`
2. Type and select: `Monkey C: Export Project`
3. Choose a signing key (you'll need your Connect IQ developer key — if you don't have one, the
   extension will prompt you to generate one)
4. The .iq file will be generated in your project directory

That's it. The .iq file is what you upload to the [Connect IQ Store dashboard](https://apps.garmin.com/developer/dashboard).

During the upload add a meaningful version changelog entry in "What’s New".
