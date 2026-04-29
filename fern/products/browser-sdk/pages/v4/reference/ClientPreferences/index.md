---
title: "ClientPreferences"
---

# Class: ClientPreferences

Defined in: [containers/PreferencesContainer.ts:479](https://github.com/signalwire/browser-sdk/blob/29c1f6cf3278bb4128a214178e02793719436b60/packages/main/src/containers/PreferencesContainer.ts#L479)

Public preferences API for configuring SDK behavior.

Exposed as [SignalWire.preferences](../SignalWire/index.md#preferences). All timeout values
are in seconds when accessed through this class.

When [enableSavePreferences](#enablesavepreferences) is called, preferences are
automatically loaded from storage and synced back on every change.

## Constructors

### Constructor

> **new ClientPreferences**(): `ClientPreferences`

#### Returns

`ClientPreferences`

## Accessors

- [`autoMuteVideoOnHidden`](./autoMuteVideoOnHidden.md)
- [`checkConnectionOnVisible`](./checkConnectionOnVisible.md)
- [`connectionTimeout`](./connectionTimeout.md)
- [`defaultAudioConstraints`](./defaultAudioConstraints.md)
- [`defaultVideoConstraints`](./defaultVideoConstraints.md)
- [`degradationBitrateThreshold`](./degradationBitrateThreshold.md)
- [`degradationRecoveryThreshold`](./degradationRecoveryThreshold.md)
- [`deviceDebounceTime`](./deviceDebounceTime.md)
- [`devicePollingInterval`](./devicePollingInterval.md)
- [`disableUdpIceServers`](./disableUdpIceServers.md)
- [`enableAutoDegradation`](./enableAutoDegradation.md)
- [`enableNetworkChangeDetection`](./enableNetworkChangeDetection.md)
- [`enableRelayFallback`](./enableRelayFallback.md)
- [`enableServerHangupInterception`](./enableServerHangupInterception.md)
- [`iceCandidateTimeout`](./iceCandidateTimeout.md)
- [`iceDisconnectedGracePeriod`](./iceDisconnectedGracePeriod.md)
- [`iceGatheringTimeout`](./iceGatheringTimeout.md)
- [`iceRestartTimeout`](./iceRestartTimeout.md)
- [`iceServers`](./iceServers.md)
- [`inputAudioConstraints`](./inputAudioConstraints.md)
- [`inputVideoConstraints`](./inputVideoConstraints.md)
- [`keyframeBurstWindow`](./keyframeBurstWindow.md)
- [`keyframeCooldown`](./keyframeCooldown.md)
- [`keyframeMaxBurst`](./keyframeMaxBurst.md)
- [`maxRecoveryAttempts`](./maxRecoveryAttempts.md)
- [`persistDeviceSelection`](./persistDeviceSelection.md)
- [`preferredAudioCodecs`](./preferredAudioCodecs.md)
- [`preferredAudioInput`](./preferredAudioInput.md)
- [`preferredAudioOutput`](./preferredAudioOutput.md)
- [`preferredVideoCodecs`](./preferredVideoCodecs.md)
- [`preferredVideoInput`](./preferredVideoInput.md)
- [`receiveAudio`](./receiveAudio.md)
- [`receiveVideo`](./receiveVideo.md)
- [`reconnectCallsTimeout`](./reconnectCallsTimeout.md)
- [`reconnectDelayMax`](./reconnectDelayMax.md)
- [`reconnectDelayMin`](./reconnectDelayMin.md)
- [`recoveryCooldown`](./recoveryCooldown.md)
- [`recoveryDebounceTime`](./recoveryDebounceTime.md)
- [`refreshDevicesOnVisible`](./refreshDevicesOnVisible.md)
- [`reinviteDebounceTime`](./reinviteDebounceTime.md)
- [`reinviteMaxAttempts`](./reinviteMaxAttempts.md)
- [`reinviteTimeout`](./reinviteTimeout.md)
- [`relayHost`](./relayHost.md)
- [`relayOnly`](./relayOnly.md)
- [`statsBaselineSamples`](./statsBaselineSamples.md)
- [`statsHistorySize`](./statsHistorySize.md)
- [`statsJitterSpikeMultiplier`](./statsJitterSpikeMultiplier.md)
- [`statsNoPacketThreshold`](./statsNoPacketThreshold.md)
- [`statsPacketLossThreshold`](./statsPacketLossThreshold.md)
- [`statsPollingInterval`](./statsPollingInterval.md)
- [`statsRttSpikeMultiplier`](./statsRttSpikeMultiplier.md)
- [`stereoAudio`](./stereoAudio.md)
- [`syncDevicesToActiveCalls`](./syncDevicesToActiveCalls.md)
- [`userVariables`](./userVariables.md)

## Methods

- [`enableSavePreferences`](./enableSavePreferences.md)
