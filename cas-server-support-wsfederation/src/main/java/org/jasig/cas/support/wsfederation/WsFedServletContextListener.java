package org.jasig.cas.support.wsfederation;


import org.jasig.cas.authentication.AuthenticationHandler;
import org.jasig.cas.authentication.principal.PrincipalResolver;
import org.jasig.cas.web.AbstractServletContextListener;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

import javax.annotation.PostConstruct;

/**
 * Initializes the CAS root servlet context to make sure
 * ADFS validation can be activated and authentication handlers injected.
 * @author Misagh Moayyed
 * @since 4.2
 */
@Component
public class WsFedServletContextListener extends AbstractServletContextListener {

    @Autowired
    @Qualifier("adfsAuthNHandler")
    private AuthenticationHandler adfsAuthNHandler;

    @Autowired
    @Qualifier("adfsPrincipalResolver")
    private PrincipalResolver adfsPrincipalResolver;

    @Value("${cas.wsfed.idp.attribute.resolver.enabled:true}")
    private boolean useResolver;

    /**
     * Initialize root application context.
     */
    @PostConstruct
    protected void initializeRootApplicationContext() {
        if (!this.useResolver) {
            addAuthenticationHandler(adfsAuthNHandler);
        } else {
            addAuthenticationHandlerPrincipalResolver(adfsAuthNHandler, adfsPrincipalResolver);
        }
    }
}

