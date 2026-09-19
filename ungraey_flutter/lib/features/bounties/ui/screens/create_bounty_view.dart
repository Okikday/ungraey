import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ungraey_client/ungraey_client.dart';
import '../../../../core/base/extensions/src/extension_on_provider.dart';
import '../../../../core/enums/material_category.dart';
import '../../../../shared/components/scale_click_wrapper.dart';
import '../../../../shared/theme/pure_theme_extension.dart';
import '../../providers/bounties_pod.dart';
import '../widgets/bounty_category_field.dart';
import '../widgets/bounty_sliders_row.dart';
import '../../models/bounty_draft.dart';

/// Modal bottom sheet allowing buyers and artisans to post commodity bounties.
class CreateBountyModal extends ConsumerStatefulWidget {
  final BountyDraft? draft;

  const CreateBountyModal({super.key, this.draft});

  @override
  ConsumerState<CreateBountyModal> createState() => _CreateBountyModalState();
}

class _CreateBountyModalState extends ConsumerState<CreateBountyModal> {
  final _titleController = TextEditingController();
  final _descController = TextEditingController();
  MaterialCategory _category = MaterialCategory.corrugatedCardboard;
  int _quantity = 25;
  int _rewardDollars = 10;
  final bool _isTrade = false;
  final _tradeController = TextEditingController();

  @override
  void initState() {
    super.initState();
    final draft = widget.draft;
    if (draft != null) {
      _category = draft.category;
      _rewardDollars = draft.rewardDollars.clamp(1, 100).toInt();
      _titleController.text = draft.titleHint;
    }
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descController.dispose();
    _tradeController.dispose();
    super.dispose();
  }

  void _submit() {
    final title = _titleController.text.trim();
    if (title.isEmpty) return;

    final bounty = Bounty(
      creatorId: 1,
      creatorName: widget.draft == null ? 'Local Maker' : 'You',
      title: title,
      description: _descController.text.trim(),
      category: _category,
      quantityNeeded: _quantity,
      rewardAmountCents: _rewardDollars * 100,
      rewardType: _isTrade ? RewardType.trade : RewardType.cash,
      tradeItemDescription: _isTrade ? _tradeController.text.trim() : null,
      latitude: 37.7749,
      longitude: -122.4194,
      addressSnippet: 'Local Neighborhood, SF',
      radiusMiles: 5.0,
      status: 'active',
      createdAt: DateTime.now(),
    );

    BountiesPod.me.not(ref).postBounty(bounty);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    final pure = context.pureTheme;

    return Container(
      height: MediaQuery.of(context).size.height * 0.85,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: pure.surface,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(28)),
      ),
      child: ListView(
        children: [
          Center(
            child: Container(
              width: 36,
              height: 4,
              decoration: BoxDecoration(
                color: pure.borderSubtle.withValues(alpha: 0.5),
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ),
          const SizedBox(height: 18),
          Text(
            'Post a Material Bounty',
            style: TextStyle(
              color: pure.textPrimary,
              fontSize: 20,
              fontWeight: FontWeight.w800,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            'Tell local neighbors what waste commodities you are buying or trading for.',
            style: TextStyle(color: pure.textMuted, fontSize: 13),
          ),
          const SizedBox(height: 20),

          // Title field
          TextField(
            controller: _titleController,
            decoration: InputDecoration(
              labelText: 'Bounty Title (e.g. Need 50 Clean Glass Jars)',
              labelStyle: TextStyle(color: pure.textMuted, fontSize: 13),
              filled: true,
              fillColor: pure.surfaceHighlight,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14),
                borderSide: BorderSide.none,
              ),
            ),
          ),
          const SizedBox(height: 14),

          // Category Dropdown
          BountyCategoryField(
            category: _category,
            onChanged: (v) => setState(() => _category = v),
          ),
          const SizedBox(height: 14),

          // Quantity & Reward Row
          BountySlidersRow(
            quantity: _quantity,
            rewardDollars: _rewardDollars,
            onQuantityChanged: (v) => setState(() => _quantity = v),
            onRewardChanged: (v) => setState(() => _rewardDollars = v),
          ),
          const SizedBox(height: 14),

          // Description
          TextField(
            controller: _descController,
            maxLines: 2,
            decoration: InputDecoration(
              labelText: 'Pickup instructions or trade conditions',
              labelStyle: TextStyle(color: pure.textMuted, fontSize: 13),
              filled: true,
              fillColor: pure.surfaceHighlight,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14),
                borderSide: BorderSide.none,
              ),
            ),
          ),
          const SizedBox(height: 24),

          // Submit CTA
          ScaleClickWrapper(
            onPressed: _submit,
            child: Container(
              height: 48,
              decoration: BoxDecoration(
                color: pure.primary,
                borderRadius: BorderRadius.circular(14),
              ),
              alignment: Alignment.center,
              child: const Text(
                'Publish Bounty to Local Network',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w800,
                  fontSize: 14,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
