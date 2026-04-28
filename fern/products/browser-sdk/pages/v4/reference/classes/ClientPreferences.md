# Class: ClientPreferences

Defined in: [containers/PreferencesContainer.ts:479](https://github.com/signalwire/browser-sdk/blob/25e5ff424d770291cfeb3801743816b995511140/packages/main/src/containers/PreferencesContainer.ts#L479)

Public preferences API for configuring SDK behavior.

Exposed as [SignalWire.preferences](SignalWire.md#preferences). All timeout values
are in seconds when accessed through this class.

When [enableSavePreferences](#enablesavepreferences) is called, preferences are
automatically loaded from storage and synced back on every change.

## Constructors

### Constructor

> **new ClientPreferences**(): `ClientPreferences`

#### Returns

`ClientPreferences`

## Accessors

- [`autoMuteVideoOnHidden`](./ClientPreferences/autoMuteVideoOnHidden.md)
- [`checkConnectionOnVisible`](./ClientPreferences/checkConnectionOnVisible.md)
- [`connectionTimeout`](./ClientPreferences/connectionTimeout.md)
- [`defaultAudioConstraints`](./ClientPreferences/defaultAudioConstraints.md)
- [`defaultVideoConstraints`](./ClientPreferences/defaultVideoConstraints.md)
- [`degradationBitrateThreshold`](./ClientPreferences/degradationBitrateThreshold.md)
- [`degradationRecoveryThreshold`](./ClientPreferences/degradationRecoveryThreshold.md)
- [`deviceDebounceTime`](./ClientPreferences/deviceDebounceTime.md)
- [`devicePollingInterval`](./ClientPreferences/devicePollingInterval.md)
- [`disableUdpIceServers`](./ClientPreferences/disableUdpIceServers.md)
- [`enableAutoDegradation`](./ClientPreferences/enableAutoDegradation.md)
- [`enableNetworkChangeDetection`](./ClientPreferences/enableNetworkChangeDetection.md)
- [`enableRelayFallback`](./ClientPreferences/enableRelayFallback.md)
- [`enableServerHangupInterception`](./ClientPreferences/enableServerHangupInterception.md)
- [`iceCandidateTimeout`](./ClientPreferences/iceCandidateTimeout.md)
- [`iceDisconnectedGracePeriod`](./ClientPreferences/iceDisconnectedGracePeriod.md)
- [`iceGatheringTimeout`](./ClientPreferences/iceGatheringTimeout.md)
- [`iceRestartTimeout`](./ClientPreferences/iceRestartTimeout.md)
- [`iceServers`](./ClientPreferences/iceServers.md)
- [`inputAudioConstraints`](./ClientPreferences/inputAudioConstraints.md)
- [`inputVideoConstraints`](./ClientPreferences/inputVideoConstraints.md)
- [`keyframeBurstWindow`](./ClientPreferences/keyframeBurstWindow.md)
- [`keyframeCooldown`](./ClientPreferences/keyframeCooldown.md)
- [`keyframeMaxBurst`](./ClientPreferences/keyframeMaxBurst.md)
- [`maxRecoveryAttempts`](./ClientPreferences/maxRecoveryAttempts.md)
- [`persistDeviceSelection`](./ClientPreferences/persistDeviceSelection.md)
- [`preferredAudioCodecs`](./ClientPreferences/preferredAudioCodecs.md)
- [`preferredAudioInput`](./ClientPreferences/preferredAudioInput.md)
- [`preferredAudioOutput`](./ClientPreferences/preferredAudioOutput.md)
- [`preferredVideoCodecs`](./ClientPreferences/preferredVideoCodecs.md)
- [`preferredVideoInput`](./ClientPreferences/preferredVideoInput.md)
- [`receiveAudio`](./ClientPreferences/receiveAudio.md)
- [`receiveVideo`](./ClientPreferences/receiveVideo.md)
- [`reconnectCallsTimeout`](./ClientPreferences/reconnectCallsTimeout.md)
- [`reconnectDelayMax`](./ClientPreferences/reconnectDelayMax.md)
- [`reconnectDelayMin`](./ClientPreferences/reconnectDelayMin.md)
- [`recoveryCooldown`](./ClientPreferences/recoveryCooldown.md)
- [`recoveryDebounceTime`](./ClientPreferences/recoveryDebounceTime.md)
- [`refreshDevicesOnVisible`](./ClientPreferences/refreshDevicesOnVisible.md)
- [`reinviteDebounceTime`](./ClientPreferences/reinviteDebounceTime.md)
- [`reinviteMaxAttempts`](./ClientPreferences/reinviteMaxAttempts.md)
- [`reinviteTimeout`](./ClientPreferences/reinviteTimeout.md)
- [`relayHost`](./ClientPreferences/relayHost.md)
- [`relayOnly`](./ClientPreferences/relayOnly.md)
- [`statsBaselineSamples`](./ClientPreferences/statsBaselineSamples.md)
- [`statsHistorySize`](./ClientPreferences/statsHistorySize.md)
- [`statsJitterSpikeMultiplier`](./ClientPreferences/statsJitterSpikeMultiplier.md)
- [`statsNoPacketThreshold`](./ClientPreferences/statsNoPacketThreshold.md)
- [`statsPacketLossThreshold`](./ClientPreferences/statsPacketLossThreshold.md)
- [`statsPollingInterval`](./ClientPreferences/statsPollingInterval.md)
- [`statsRttSpikeMultiplier`](./ClientPreferences/statsRttSpikeMultiplier.md)
- [`stereoAudio`](./ClientPreferences/stereoAudio.md)
- [`syncDevicesToActiveCalls`](./ClientPreferences/syncDevicesToActiveCalls.md)
- [`userVariables`](./ClientPreferences/userVariables.md)

## Methods

- [`enableSavePreferences`](./ClientPreferences/enableSavePreferences.md)
