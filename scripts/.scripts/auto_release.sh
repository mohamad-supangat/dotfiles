glab mr create --remove-source-branch -b dev && \
glab mr approve && glab mr merge && \
glab mr create -s dev -b master && \
glab mr approve dev && glab mr merge dev && \
git fetch origin && \
git checkout master && git merge master origin/master && \
release -it $1 && \
glab release create -n  $1 $1 \
git fetch origin && \
smerge .


