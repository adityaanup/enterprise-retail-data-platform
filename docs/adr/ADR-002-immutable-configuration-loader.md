Status: Accepted

Decision:

ConfigLoader is immutable after construction.
The configuration path cannot be modified.
To use a different configuration, create a new ConfigLoader instance.

Rationale:

Predictable behavior
Safe caching
Easier testing
Better thread safety
Clear object lifecycle