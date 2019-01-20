function post_install(){
    local giturl=@git_url
    local pkgdir="${PEARL_PKGVARDIR}/pack/${PEARL_PKGREPONAME}/start"

    # Install/update the dependency here:
    # pearl emerge PEARL_REPO_NAME/mydep

    info "Installing or updating the ${PEARL_PKGNAME} git repository..."
    mkdir -p $pkgdir
    install_or_update_git_repo $giturl "$pkgdir/${PEARL_PKGNAME}" master
    if [ -d "$pkgdir/${PEARL_PKGNAME}/doc" ] && [ `which vim` ]; then
        info "Generating the help tags..."
        vim -u NONE -c "helptags $pkgdir/${PEARL_PKGNAME}/doc" -c q
    fi

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
