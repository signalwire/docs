// `uuid` and `jwt` scalars live in `_shared/types/main.tsp` so they are
// reachable from every spec project (signalwire-rest + compatibility-api).
// This file re-imports them so existing `import "../../types"` chains in
// signalwire-rest keep working without changes.
import "../../../_shared/types/main.tsp";
