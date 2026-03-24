Aca voy a poner los perfiles tranvesales:

1- Paciente
2- Organization


------------------------------------------------------------------------

BASE: 
    Id: lac-organization
    Id: lac-patient

NUEVOS:
    Id: lac-medication-order
    Id: lac-service-request

IPS: 
    Id: lac-composition-ips
    Id: lac-bundle-ips

ICVP:
    Id: lac-composition-ips-icvp (a confirmar si se crea)
    Id: lac-bundle-ips-icvp

--------------------------------------------------------------------------------
MHD: - a confirmar si se crean perfiles específicos para MHD o se utilizan los perfiles de MHD sin modificaciones. 
    Id: List 
    Id: DocRefMHD
    Id: BundleMHD (lac-bundle-ips o lac-bundle-ips-icvp)

--------------------------------------------------------------------------------

