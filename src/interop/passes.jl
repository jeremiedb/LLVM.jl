export alloc_opt!, barrier_noop!, gc_invariant_verifier!, lower_exc_handlers!,
       combine_mul_add!, multi_versioning!, propagate_julia_addrsp!, lower_ptls!,
       lower_simdloop!, late_lower_gc_frame!, final_lower_gc!, remove_julia_addrspaces!

alloc_opt!(pm::PassManager) =
    API.LLVMAddAllocOptPass(pm)

barrier_noop!(pm::PassManager) =
    API.LLVMAddBarrierNoopPass(pm)

gc_invariant_verifier!(pm::PassManager, strong::Bool=false) =
    API.LLVMAddGCInvariantVerifierPass(pm, convert(Bool, strong))

lower_exc_handlers!(pm::PassManager) =
    API.LLVMAddLowerExcHandlersPass(pm)

combine_mul_add!(pm::PassManager) =
    API.LLVMAddCombineMulAddPass(pm)

multi_versioning!(pm::PassManager) =
    API.LLVMAddMultiVersioningPass(pm)

propagate_julia_addrsp!(pm::PassManager) =
    API.LLVMAddPropagateJuliaAddrspaces(pm)

lower_ptls!(pm::PassManager, imaging_mode::Bool=false) =
    API.LLVMAddLowerPTLSPass(pm, convert(Bool, imaging_mode))

lower_simdloop!(pm::PassManager) =
    API.LLVMAddLowerSimdLoopPass(pm)

late_lower_gc_frame!(pm::PassManager) =
    API.LLVMAddLateLowerGCFramePass(pm)

if VERSION >= v"1.3.0-DEV.95"
    final_lower_gc!(pm::PassManager) =
        API.LLVMAddFinalLowerGCPass(pm)
else
    final_lower_gc!(pm::PassManager) = nothing
end

if VERSION >= v"1.5.0-DEV.802"
    remove_julia_addrspaces!(pm::PassManager) = API.LLVMAddRemoveJuliaAddrspacesPass(pm)
else
    remove_julia_addrspaces!(pm::PassManager) = nothing
end
