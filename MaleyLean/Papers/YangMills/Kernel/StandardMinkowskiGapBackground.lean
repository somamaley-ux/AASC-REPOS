import MaleyLean.Papers.YangMills.Kernel.VacuumGapCore
import MaleyLean.Papers.YangMills.Kernel.EndpointCore
import MaleyLean.Papers.YangMills.Kernel.HamiltonianMassGap

namespace MaleyLean

/--
Spectral form of the vacuum Hamiltonian mass gap.

This is intentionally abstract at the carrier level: it names the mathematical
payload that an external OS/Wightman spectral-transfer theorem must provide.
-/
structure YMVacuumHamiltonianMassGap where
  HilbertSpace : Type
  Hamiltonian : Type
  VacuumVector : Type
  GapScale : Type
  positive_gap_scale : Prop
  spectrum_gap :
    Prop
  vacuum_kernel_unique :
    Prop

def YMVacuumHamiltonianMassGap.closed
    (G : YMVacuumHamiltonianMassGap) :
    Prop :=
  G.positive_gap_scale /\ G.spectrum_gap /\ G.vacuum_kernel_unique

/--
Bridge from the explicit real Hamiltonian spectral payload to the existing
route-facing M.5 mass-gap socket.

The bridge keeps the old `YMVacuumHamiltonianMassGap` interface stable while
requiring the A+ proof path to pass through an actual spectral-gap payload.
-/
structure YMMinkowskiHamiltonianMassGapPayloadBridge where
  spectral_payload : Papers.YangMills.YMHamiltonianRealMassGap
  standard_gap : YMVacuumHamiltonianMassGap
  positive_gap_from_payload :
    0 < spectral_payload.gap ->
      standard_gap.positive_gap_scale
  spectrum_gap_from_payload :
    (forall {energy : Real},
      spectral_payload.spectrum energy ->
        energy = 0 \/ spectral_payload.gap <= energy) ->
      standard_gap.spectrum_gap
  vacuum_kernel_from_payload :
    (forall {psi : spectral_payload.HilbertSpace},
      spectral_payload.zeroEnergyState psi ->
        spectral_payload.vacuumSector psi) ->
      standard_gap.vacuum_kernel_unique

theorem YMMinkowskiHamiltonianMassGapPayloadBridge.closed
    (B : YMMinkowskiHamiltonianMassGapPayloadBridge) :
    B.standard_gap.closed := by
  exact
    And.intro
      (B.positive_gap_from_payload
        B.spectral_payload.positive_gap)
      (And.intro
        (B.spectrum_gap_from_payload
          (fun henergy =>
            B.spectral_payload.spectral_values_are_vacuum_or_above_gap henergy))
        (B.vacuum_kernel_from_payload
          (fun hpsi =>
            B.spectral_payload.zero_energy_is_vacuum hpsi)))

/--
Explicit M.5 hypothesis packet: the standard theorem is allowed, but its input
requirements are no longer invisible.
-/
structure YMMinkowskiGapTransferHypotheses where
  reflection_positive : Prop
  os_reconstruction_ready : Prop
  wightman_reconstruction_ready : Prop
  strongly_continuous_time_translations : Prop
  self_adjoint_hamiltonian_generator : Prop
  vacuum_vector_present : Prop
  local_gap_lower_bound : Prop
  zero_energy_vacuum_unique : Prop

def YMMinkowskiGapTransferHypotheses.complete
    (H : YMMinkowskiGapTransferHypotheses) :
    Prop :=
  H.reflection_positive /\
  H.os_reconstruction_ready /\
  H.wightman_reconstruction_ready /\
  H.strongly_continuous_time_translations /\
  H.self_adjoint_hamiltonian_generator /\
  H.vacuum_vector_present /\
  H.local_gap_lower_bound /\
  H.zero_energy_vacuum_unique

/--
The standard M.5 import, named as a theorem object rather than folded into a
generic `minkowski_gap_ready` field.
-/
structure YMStandardMinkowskiGapTransfer where
  hypotheses : YMMinkowskiGapTransferHypotheses
  spectral_gap : YMVacuumHamiltonianMassGap
  transfer :
    hypotheses.complete -> spectral_gap.closed

/--
A route-specific use of the M.5 standard theorem.  The final field is the only
place where the theorem-shaped spectral conclusion is identified with the
existing route proposition.
-/
structure YMRouteMinkowskiGapImport (R : YMVacuumGapRoute) where
  standard_m5 : YMStandardMinkowskiGapTransfer
  hypotheses_verified : standard_m5.hypotheses.complete
  route_gap_from_spectral_gap :
    standard_m5.spectral_gap.closed ->
      R.reconstruction_package.minkowski_gap_ready

theorem YMRouteMinkowskiGapImport.discharge
    {R : YMVacuumGapRoute}
    (I : YMRouteMinkowskiGapImport R) :
    R.reconstruction_package.minkowski_gap_ready := by
  exact I.route_gap_from_spectral_gap
    (I.standard_m5.transfer I.hypotheses_verified)

/--
Which M.5 hypotheses are visible in the recovered route/endpoint packages, and
which must still be supplied by the standard spectral-transfer import.
-/
structure YMRouteMinkowskiGapHypothesisMap
    (RD : YMVacuumGapRoute)
    (RE : YMEndpointCore) where
  route_reconstruction_ready :
    RD.reconstruction_ready
  endpoint_reconstruction_ready :
    RE.reconstruction_ready
  os_sector_ready :
    RD.reconstruction_package.os_sector_ready
  wightman_reconstruction_ready :
    RE.reconstruction_package.wightman_fields_present
  vacuum_vector_present :
    RE.reconstruction_package.vacuum_vector_present
  local_gap_lower_bound :
    RD.transport_package.positive_gap_exhibited
  lattice_gap_input :
    RD.transport_package.lattice_gap_input
  strong_continuity_external :
    Prop
  self_adjoint_generator_external :
    Prop
  zero_energy_vacuum_unique_external :
    Prop

/--
Standard Hamiltonian-dynamics background used by the M.5 spectral-transfer
step.

This isolates the remaining Stone/spectral uniqueness content from the route
and endpoint bookkeeping.  At A+ level each field must either be proved from
the reconstructed Wightman data or cited as a standard theorem with these
hypotheses verified.
-/
structure YMStandardHamiltonianDynamicsBackground where
  TimeParameter : Type
  HilbertSpace : Type
  TimeTranslation : TimeParameter -> Type
  Hamiltonian : Type
  VacuumVector : Type
  strongly_continuous_time_translations : Prop
  self_adjoint_hamiltonian_generator : Prop
  time_translation_generated_by_hamiltonian : Prop
  vacuum_in_zero_energy_kernel : Prop
  zero_energy_vacuum_unique : Prop

def YMStandardHamiltonianDynamicsBackground.complete
    (D : YMStandardHamiltonianDynamicsBackground) :
    Prop :=
  D.strongly_continuous_time_translations /\
  D.self_adjoint_hamiltonian_generator /\
  D.time_translation_generated_by_hamiltonian /\
  D.vacuum_in_zero_energy_kernel /\
  D.zero_energy_vacuum_unique

/--
A route-specific import of the standard Hamiltonian dynamics conclusions still
needed by M.5.  The implication fields are the identification map between the
abstract standard theorem object and this route's named obligations.
-/
structure YMRouteHamiltonianDynamicsImport
    {RD : YMVacuumGapRoute}
    {RE : YMEndpointCore}
    (M : YMRouteMinkowskiGapHypothesisMap RD RE) where
  dynamics : YMStandardHamiltonianDynamicsBackground
  dynamics_complete : dynamics.complete
  strong_continuity_matches_route :
    dynamics.strongly_continuous_time_translations ->
      M.strong_continuity_external
  self_adjoint_generator_matches_route :
    dynamics.self_adjoint_hamiltonian_generator ->
      M.self_adjoint_generator_external
  zero_energy_uniqueness_matches_route :
    dynamics.zero_energy_vacuum_unique ->
      M.zero_energy_vacuum_unique_external

def YMRouteMinkowskiGapHypothesisMap.externalComplete
    {RD : YMVacuumGapRoute}
    {RE : YMEndpointCore}
    (M : YMRouteMinkowskiGapHypothesisMap RD RE) :
    Prop :=
  M.strong_continuity_external /\
  M.self_adjoint_generator_external /\
  M.zero_energy_vacuum_unique_external

theorem YMRouteHamiltonianDynamicsImport.dischargeExternal
    {RD : YMVacuumGapRoute}
    {RE : YMEndpointCore}
    {M : YMRouteMinkowskiGapHypothesisMap RD RE}
    (I : YMRouteHamiltonianDynamicsImport M) :
    M.externalComplete := by
  exact
    And.intro
      (I.strong_continuity_matches_route I.dynamics_complete.1)
      (And.intro
        (I.self_adjoint_generator_matches_route I.dynamics_complete.2.1)
        (I.zero_energy_uniqueness_matches_route
          I.dynamics_complete.2.2.2.2))

def YMRouteMinkowskiGapHypothesisMap.toTransferHypotheses
    {RD : YMVacuumGapRoute}
    {RE : YMEndpointCore}
    (M : YMRouteMinkowskiGapHypothesisMap RD RE) :
    YMMinkowskiGapTransferHypotheses where
  reflection_positive := RD.transport_package.os_transport_ready
  os_reconstruction_ready := RD.reconstruction_package.os_sector_ready
  wightman_reconstruction_ready :=
    RE.reconstruction_package.wightman_fields_present
  strongly_continuous_time_translations := M.strong_continuity_external
  self_adjoint_hamiltonian_generator := M.self_adjoint_generator_external
  vacuum_vector_present := RE.reconstruction_package.vacuum_vector_present
  local_gap_lower_bound := RD.transport_package.positive_gap_exhibited
  zero_energy_vacuum_unique := M.zero_energy_vacuum_unique_external

theorem YMRouteMinkowskiGapHypothesisMap.completeTransferHypotheses
    {RD : YMVacuumGapRoute}
    {RE : YMEndpointCore}
    (M : YMRouteMinkowskiGapHypothesisMap RD RE)
    (hos : RD.transport_package.os_transport_ready)
    (hexternal : M.externalComplete) :
    M.toTransferHypotheses.complete := by
  exact
    And.intro hos <|
      And.intro M.os_sector_ready <|
        And.intro M.wightman_reconstruction_ready <|
          And.intro hexternal.1 <|
            And.intro hexternal.2.1 <|
              And.intro M.vacuum_vector_present <|
                And.intro M.local_gap_lower_bound hexternal.2.2

def YMRouteMinkowskiGapImport.fromHypothesisMap
    {RD : YMVacuumGapRoute}
    {RE : YMEndpointCore}
    (M : YMRouteMinkowskiGapHypothesisMap RD RE)
    (standard_m5 : YMStandardMinkowskiGapTransfer)
    (hstandard :
      standard_m5.hypotheses = M.toTransferHypotheses)
    (hos : RD.transport_package.os_transport_ready)
    (dynamics_import : YMRouteHamiltonianDynamicsImport M)
    (route_gap_from_spectral_gap :
      standard_m5.spectral_gap.closed ->
        RD.reconstruction_package.minkowski_gap_ready) :
    YMRouteMinkowskiGapImport RD where
  standard_m5 := standard_m5
  hypotheses_verified := by
    rw [hstandard]
    exact M.completeTransferHypotheses
      hos
      dynamics_import.dischargeExternal
  route_gap_from_spectral_gap := route_gap_from_spectral_gap

theorem YMRouteMinkowskiGapImport.dischargeFromHypothesisMap
    {RD : YMVacuumGapRoute}
    {RE : YMEndpointCore}
    (M : YMRouteMinkowskiGapHypothesisMap RD RE)
    (standard_m5 : YMStandardMinkowskiGapTransfer)
    (hstandard :
      standard_m5.hypotheses = M.toTransferHypotheses)
    (hos : RD.transport_package.os_transport_ready)
    (dynamics_import : YMRouteHamiltonianDynamicsImport M)
    (route_gap_from_spectral_gap :
      standard_m5.spectral_gap.closed ->
        RD.reconstruction_package.minkowski_gap_ready) :
    RD.reconstruction_package.minkowski_gap_ready := by
  exact
    (YMRouteMinkowskiGapImport.fromHypothesisMap
      M
      standard_m5
      hstandard
      hos
      dynamics_import
      route_gap_from_spectral_gap).discharge

def YMRouteMinkowskiGapHypothesisMap.fromReadiness
    (RD : YMVacuumGapRoute)
    (RE : YMEndpointCore)
    (hww : RD.weak_window_certificate_ready)
    (hE : RE.euclidean_dossier_ready)
    (hP : RE.endpoint_packet_ready)
    (strong_continuity_external : Prop)
    (self_adjoint_generator_external : Prop)
    (zero_energy_vacuum_unique_external : Prop) :
    YMRouteMinkowskiGapHypothesisMap RD RE := by
  have hD := YangMillsVacuumGapCoreExhibitsNamedOutputsStatement RD hww
  have hEnd := YangMillsEndpointCoreExhibitsNamedOutputsStatement RE hE hP
  exact
    { route_reconstruction_ready := hD.2.2.2.2.1
      endpoint_reconstruction_ready := hEnd.1
      os_sector_ready := hD.2.2.2.2.2.1
      wightman_reconstruction_ready := hEnd.2.1
      vacuum_vector_present := hEnd.2.2.1
      local_gap_lower_bound := hD.2.2.1
      lattice_gap_input := hD.2.2.2.1
      strong_continuity_external := strong_continuity_external
      self_adjoint_generator_external := self_adjoint_generator_external
      zero_energy_vacuum_unique_external := zero_energy_vacuum_unique_external }

/--
Single manuscript/import package for the Minkowski Hamiltonian mass-gap row.

It packages the real Hamiltonian spectral payload, its route-facing bridge,
the standard M.5 transfer theorem object, and the Hamiltonian-dynamics
background as one coherent source import.  Inhabiting this package is the
remaining source task; the projections below are only axiom-free routing.
-/
structure YMStandardMinkowskiHamiltonianGapImport where
  dossier_ready : Prop
  dossier_ready_holds : dossier_ready
  hamiltonian_mass_gap_payload :
    Papers.YangMills.YMHamiltonianRealMassGap
  hamiltonian_payload_bridge :
    YMMinkowskiHamiltonianMassGapPayloadBridge
  standard_transfer : YMStandardMinkowskiGapTransfer
  hamiltonian_dynamics : YMStandardHamiltonianDynamicsBackground
  hamiltonian_dynamics_complete : hamiltonian_dynamics.complete
  bridge_matches_payload :
    hamiltonian_payload_bridge.spectral_payload =
      hamiltonian_mass_gap_payload
  transfer_matches_bridge :
    standard_transfer.spectral_gap =
      hamiltonian_payload_bridge.standard_gap
  source_document_key : String
  source_labels : List String
  source_matches_manuscript : Prop
  source_matches_manuscript_verified : source_matches_manuscript

theorem YMStandardMinkowskiHamiltonianGapImport.payload_nonempty
    (I : YMStandardMinkowskiHamiltonianGapImport) :
    Nonempty Papers.YangMills.YMHamiltonianRealMassGap := by
  exact ⟨I.hamiltonian_mass_gap_payload⟩

theorem YMStandardMinkowskiHamiltonianGapImport.payload_bridge_nonempty
    (I : YMStandardMinkowskiHamiltonianGapImport) :
    Nonempty YMMinkowskiHamiltonianMassGapPayloadBridge := by
  exact ⟨I.hamiltonian_payload_bridge⟩

theorem YMStandardMinkowskiHamiltonianGapImport.standard_transfer_nonempty
    (I : YMStandardMinkowskiHamiltonianGapImport) :
    Nonempty YMStandardMinkowskiGapTransfer := by
  exact ⟨I.standard_transfer⟩

theorem YMStandardMinkowskiHamiltonianGapImport.hamiltonian_dynamics_nonempty
    (I : YMStandardMinkowskiHamiltonianGapImport) :
    Nonempty YMStandardHamiltonianDynamicsBackground := by
  exact ⟨I.hamiltonian_dynamics⟩

theorem
    YMStandardMinkowskiHamiltonianGapImport.hamiltonian_dynamics_complete_nonempty
    (I : YMStandardMinkowskiHamiltonianGapImport) :
    Nonempty {D : YMStandardHamiltonianDynamicsBackground // D.complete} := by
  exact ⟨⟨I.hamiltonian_dynamics, I.hamiltonian_dynamics_complete⟩⟩

theorem ymHamiltonianRealMassGap_nonempty_of_standard_minkowski_import
    (hImport : Nonempty YMStandardMinkowskiHamiltonianGapImport) :
    Nonempty Papers.YangMills.YMHamiltonianRealMassGap := by
  rcases hImport with ⟨I⟩
  exact I.payload_nonempty

theorem ymMinkowskiHamiltonianMassGapPayloadBridge_nonempty_of_standard_import
    (hImport : Nonempty YMStandardMinkowskiHamiltonianGapImport) :
    Nonempty YMMinkowskiHamiltonianMassGapPayloadBridge := by
  rcases hImport with ⟨I⟩
  exact I.payload_bridge_nonempty

theorem ymStandardMinkowskiGapTransfer_nonempty_of_standard_import
    (hImport : Nonempty YMStandardMinkowskiHamiltonianGapImport) :
    Nonempty YMStandardMinkowskiGapTransfer := by
  rcases hImport with ⟨I⟩
  exact I.standard_transfer_nonempty

theorem ymStandardHamiltonianDynamicsBackground_nonempty_of_standard_import
    (hImport : Nonempty YMStandardMinkowskiHamiltonianGapImport) :
    Nonempty YMStandardHamiltonianDynamicsBackground := by
  rcases hImport with ⟨I⟩
  exact I.hamiltonian_dynamics_nonempty

theorem
    ymStandardHamiltonianDynamicsBackgroundComplete_nonempty_of_standard_import
    (hImport : Nonempty YMStandardMinkowskiHamiltonianGapImport) :
    Nonempty {D : YMStandardHamiltonianDynamicsBackground // D.complete} := by
  rcases hImport with ⟨I⟩
  exact I.hamiltonian_dynamics_complete_nonempty

end MaleyLean
