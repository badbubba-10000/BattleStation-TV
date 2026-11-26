// Cloud accounts and synchronization are optional.
// IPTV credentials must remain securely stored on the device.
const localDataOnly = bool.fromEnvironment(
  'LOCAL_DATA_ONLY',
  defaultValue: false,
);