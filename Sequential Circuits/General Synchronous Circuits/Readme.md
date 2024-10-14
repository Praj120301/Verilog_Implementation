# General Synchronous Systems


In a sequential design, the system’s behavior depends on both current and past inputs, with key components being the state register logic, next state logic, and output logic.

 The state register logic stores the current state and updates it at each clock cycle, allowing the system to retain memory of its previous states. This feedback mechanism ensures the system evolves predictably over time.

The next state logic determines how the system transitions between states based on the current state and inputs. Although it operates combinationally, state transitions occur only at clock edges, keeping the design synchronized.

The output logic generates the outputs based on the state (in Moore machines) or both the state and inputs (in Mealy machines). This ensures that outputs are stable and updated in sync with the clock, making the design responsive to both history and current conditions. Together, these components form the foundation of sequential designs, enabling time-dependent, clock-synchronized system behavior.
