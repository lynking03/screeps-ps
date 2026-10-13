export const setImpl = (value) => {
  RawMemory.set(value);
};

export const setActiveSegmentsImpl = (ids) => {
  RawMemory.setActiveSegments(ids);
};

export const setActiveForeignSegmentImpl = (username) => {
  RawMemory.setActiveForeignSegment(username);
};

export const setActiveForeignSegmentIdImpl = (username, id) => {
  RawMemory.setActiveForeignSegment(username, id);
};
