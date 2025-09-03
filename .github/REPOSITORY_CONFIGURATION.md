# Repository Configuration for Dirty_Cow

This repository requires the following configuration to meet the specified requirements:

## Repository Settings
- **Visibility**: Public
- **Status**: Archived
- **Default Branch**: main (protected)

## Branch Protection Rules for `main`
- Require pull request reviews before merging
- Dismiss stale reviews when new commits are pushed
- Require status checks to pass before merging
- Restrict pushes that create files larger than 100 MB
- Prevent force pushes
- Prevent branch deletions

## Implementation Steps

### Option 1: Manual Configuration via GitHub Web Interface
1. Go to repository Settings → General
2. Change visibility to "Public" 
3. Go to Settings → Branches
4. Add protection rule for `main` branch with the settings above
5. Go to Settings → General → Danger Zone
6. Archive the repository

### Option 2: Using GitHub CLI (if available)
```bash
# Set branch protection
gh api repos/Dieg0bl/Dirty_Cow/branches/main/protection \
  --method PUT \
  --field required_status_checks='{"strict":true,"contexts":[]}' \
  --field enforce_admins=true \
  --field required_pull_request_reviews='{"required_approving_review_count":1,"dismiss_stale_reviews":true}' \
  --field restrictions=null \
  --field allow_force_pushes=false \
  --field allow_deletions=false

# Archive repository (requires owner permissions)
gh api repos/Dieg0bl/Dirty_Cow --method PATCH --field archived=true
```

### Option 3: Repository Settings App
If using the [Repository Settings GitHub App](https://github.com/apps/settings), the settings.yml file in this directory will automatically configure the repository according to the specified rules.

## Current Status
- ✅ Configuration files created
- ⏳ Repository visibility: Needs to be set to Public
- ⏳ Repository archival: Needs to be implemented
- ⏳ Main branch protection: Needs to be configured

## Notes
- The repository contains a Dirty COW exploit demonstration
- Archive status will make the repository read-only
- Branch protection should be applied before archiving