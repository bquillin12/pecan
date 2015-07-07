! Exponential integral: S13AAF routine from the NAG library

subroutine expint(k, tau)
    use mod_dataspec_wavelength
    implicit none
    real*8,intent(in) :: k(nw)
    real*8,intent(out) :: tau(nw)

    real*8,dimension(nw) :: xx,yy

    where (k.le.0.0)
        tau=1
    end where
    where (k.gt.0.0.and.k.le.4.0)
        xx=0.5*k-1.0
        yy=(((((((((((((((-3.60311230482612224d-13 &
            *xx+3.46348526554087424d-12)*xx-2.99627399604128973d-11) &
            *xx+2.57747807106988589d-10)*xx-2.09330568435488303d-9) &
            *xx+1.59501329936987818d-8)*xx-1.13717900285428895d-7) &
            *xx+7.55292885309152956d-7)*xx-4.64980751480619431d-6) &
            *xx+2.63830365675408129d-5)*xx-1.37089870978830576d-4) &
            *xx+6.47686503728103400d-4)*xx-2.76060141343627983d-3) &
            *xx+1.05306034687449505d-2)*xx-3.57191348753631956d-2) &
            *xx+1.07774527938978692d-1)*xx-2.96997075145080963d-1
        yy=(yy*xx+8.64664716763387311d-1)*xx+7.42047691268006429d-1
        yy=yy-log(k)
        tau=(1.0-k)*dexp(-k)+k**2*yy
    end where
    where (k.gt.4.0.and.k.le.85.0)
        xx=14.5/(k+3.25)-1.0
        yy=(((((((((((((((-1.62806570868460749d-12 &
        *xx-8.95400579318284288d-13)*xx-4.08352702838151578d-12) &
        *xx-1.45132988248537498d-11)*xx-8.35086918940757852d-11) &
        *xx-2.13638678953766289d-10)*xx-1.10302431467069770d-9) &
        *xx-3.67128915633455484d-9)*xx-1.66980544304104726d-8) &
        *xx-6.11774386401295125d-8)*xx-2.70306163610271497d-7) &
        *xx-1.05565006992891261d-6)*xx-4.72090467203711484d-6) &
        *xx-1.95076375089955937d-5)*xx-9.16450482931221453d-5) &
        *xx-4.05892130452128677d-4)*xx-2.14213055000334718d-3
        yy=((yy*xx-1.06374875116569657d-2)*xx-8.50699154984571871d-2)*xx+9.23755307807784058d-1
        yy=exp(-k)*yy/k
        tau=(1.0-k)*dexp(-k)+k**2*yy
    end where
    where (k.gt.85.0)
        tau=0
    end where

end subroutine
