// Load before any compiled module:  node --import ./test/setup-globals.mjs <entry>
// Screeps.Constants reads the game's globals when it is evaluated, and ES module
// imports are evaluated before the importing module's body, so the globals have
// to exist before the first import. Source: the engine's own constants table.
import { createRequire } from "node:module";

const require = createRequire(import.meta.url);
Object.assign(globalThis, require("@screeps/common/lib/constants.js"));
globalThis.global = globalThis;

// Minimal stand-ins for per-tick globals and prototypes. Tests extend these.
globalThis.Memory = {};
globalThis.Game = { getObjectById: () => null };
class RoomObject {}
class Structure extends RoomObject {}
class OwnedStructure extends Structure {}
class StructureTower extends OwnedStructure {}
class StructureSpawn extends OwnedStructure {}
class Creep extends RoomObject {}
class Source extends RoomObject {}
Object.assign(globalThis, {
  RoomObject, Structure, OwnedStructure, StructureTower, StructureSpawn, Creep, Source,
});
