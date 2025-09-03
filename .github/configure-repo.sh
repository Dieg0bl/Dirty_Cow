#!/bin/bash
# Repository Configuration Script for Dirty_Cow
# This script helps configure the repository according to requirements

set -e

REPO_OWNER="Dieg0bl"
REPO_NAME="Dirty_Cow"

echo "🔧 Dirty_Cow Repository Configuration Script"
echo "=============================================="
echo ""

# Check if GitHub CLI is available
if ! command -v gh &> /dev/null; then
    echo "❌ GitHub CLI (gh) is required but not installed."
    echo "   Please install it from: https://github.com/cli/cli"
    echo ""
    echo "🔄 Alternative: Use GitHub web interface"
    echo "   1. Go to https://github.com/${REPO_OWNER}/${REPO_NAME}/settings"
    echo "   2. Set repository to Public"
    echo "   3. Configure branch protection for 'main'"
    echo "   4. Archive the repository"
    exit 1
fi

echo "✅ GitHub CLI found"
echo ""

# Check authentication
if ! gh auth status &> /dev/null; then
    echo "❌ Not authenticated with GitHub CLI"
    echo "   Run: gh auth login"
    exit 1
fi

echo "✅ GitHub CLI authenticated"
echo ""

echo "📋 Configuring repository settings..."

# Note: These commands require appropriate permissions
echo "🔒 Setting up branch protection for 'main' branch..."
gh api repos/${REPO_OWNER}/${REPO_NAME}/branches/main/protection \
  --method PUT \
  --field required_status_checks='{"strict":true,"contexts":[]}' \
  --field enforce_admins=true \
  --field required_pull_request_reviews='{"required_approving_review_count":1,"dismiss_stale_reviews":true,"require_code_owner_reviews":false}' \
  --field restrictions=null \
  --field allow_force_pushes=false \
  --field allow_deletions=false \
  || echo "❌ Failed to set branch protection (requires admin access)"

echo ""
echo "📦 Archiving repository..."
gh api repos/${REPO_OWNER}/${REPO_NAME} \
  --method PATCH \
  --field archived=true \
  || echo "❌ Failed to archive repository (requires admin access)"

echo ""
echo "✅ Repository configuration completed!"
echo ""
echo "📝 Verification:"
echo "   - Check repository is Public"
echo "   - Check repository is Archived" 
echo "   - Check 'main' branch protection is enabled"