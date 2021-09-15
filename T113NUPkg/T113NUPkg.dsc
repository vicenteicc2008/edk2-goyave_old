################################################################################
#
# Defines Section - statements that will be processed to create a Makefile.
#
################################################################################
[Defines]
  PLATFORM_NAME                  = T113NUPkg
  PLATFORM_GUID                  = 566ba710-0bee-48e0-b56e-dcf4b0a38e04
  PLATFORM_VERSION               = 0.1
  DSC_SPECIFICATION              = 0x00010005
  OUTPUT_DIRECTORY               = Build/T113NU-$(ARCH)
  SUPPORTED_ARCHITECTURES        = ARM
  BUILD_TARGETS                  = DEBUG|RELEASE
  SKUID_IDENTIFIER               = DEFAULT
  FLASH_DEFINITION               = T113NUPkg/T113NUPkg.fdf


[PcdsFixedAtBuild.common]
  gArmTokenSpaceGuid.PcdSystemMemorySize|0x40000000         # 1GB
  gArmTokenSpaceGuid.PcdSystemMemoryBase|0x00000000
  gArmPlatformTokenSpaceGuid.PcdCoreCount|4
  gT113NUPkgTokenSpaceGuid.PcdPreAllocatedMemorySize|0x3CD00000
  gT113NUPkgTokenSpaceGuid.PcdUefiMemPoolSize|0x03300000

  # Default resolution for this firmware can be seen in dec file, override here for specific platform configuration if needed
  gT113NUPkgTokenSpaceGuid.PcdMipiFrameBufferWidth|1080
  gT113NUPkgTokenSpaceGuid.PcdMipiFrameBufferHeight|600
  gT113NUPkgTokenSpaceGuid.PcdMipiFrameBufferVisibleWidth|1080
  gT113NUPkgTokenSpaceGuid.PcdMipiFrameBufferVisibleHeight|600

[PcdsDynamicDefault.common]
  #
  # Set video resolution for boot options and for text setup.
  # PlatformDxe can set the former at runtime.
  #
  gEfiMdeModulePkgTokenSpaceGuid.PcdVideoHorizontalResolution|1080
  gEfiMdeModulePkgTokenSpaceGuid.PcdVideoVerticalResolution|600
  gEfiMdeModulePkgTokenSpaceGuid.PcdSetupVideoHorizontalResolution|1080
  gEfiMdeModulePkgTokenSpaceGuid.PcdSetupVideoVerticalResolution|600
  gEfiMdeModulePkgTokenSpaceGuid.PcdSetupConOutRow|135
  gEfiMdeModulePkgTokenSpaceGuid.PcdSetupConOutColumn|31

!include T113NUPkg/Shared.dsc.inc
