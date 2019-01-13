function post_install(){
    local giturl=@git_url

    # Install/update the dependency here:
    # pearl emerge PEARL_REPO_NAME/mydep

    info "Installing or updating the ${PEARL_PKGNAME} git repository..."
    mkdir -p "${PEARL_PKGVARDIR}/pack/${PEARL_PKGREPONAME}/start"
    install_or_update_git_repo $giturl "${PEARL_PKGVARDIR}/pack/${PEARL_PKGREPONAME}/start/${PEARL_PKGNAME}" master

    return 0
}

function post_update(){
    post_install
}

function pre_remove(){
    rm -rf "${PEARL_PKGVARDIR}"

    # Uncomment below to strictly remove the dependency
    # pearl remove PEARL_PKGREPONAME/mydep

    return 0
}

# vim: ft=sh
