import type { ScalarOptions } from '@scalar/docusaurus'
import type { PluginConfig } from '@docusaurus/types'



export const scalarApiPlugin: PluginConfig = [
  '@scalar/docusaurus',
  {
    label: 'SignalWire Calling API',
    route: '/scalar/calling',
    showNavLink: false,
    configuration: {
        hideModels: true,
        hideClientButtons: true,
        

        sources: [
      {
        fileName: 'calling-api',
        url: '/plugins/scalar/calling/openapi.yaml',
        title: 'SignalWire Calling API',
      },
      {
        fileName: 'fabric-api',
        url: '/plugins/scalar/fabric/openapi.yaml',
        title: 'SignalWire Fabric API',
      }
    ],
    },
  } as ScalarOptions,
];