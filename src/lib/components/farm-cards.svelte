<script lang="ts">
	import { Card, CardContent } from '$lib/components/ui/card';
	import { reveal, stagger } from '$lib/actions/reveal';
	import { Sprout } from '@lucide/svelte';
	import type { Farm } from '$lib/types';
	import { assetUrl } from '$lib/assets';

	let { farms, showStats = false }: { farms: Farm[]; showStats?: boolean } = $props();
</script>

<div class="grid gap-6 md:grid-cols-3">
	{#each farms as farm, i (farm.name)}
		<div use:reveal={{ delay: stagger(i, 130), y: 36, scale: 0.98, duration: 1000 }}>
			<Card class="lift group h-full overflow-hidden hover:border-primary/40 hover:shadow-xl">
				{#if farm.image}
					<div class="overflow-hidden">
						<img
							src={assetUrl(farm.image)}
							alt={farm.name}
							class="aspect-video w-full object-cover transition-transform duration-1200 ease-out group-hover:scale-105"
						/>
					</div>
				{/if}
				<CardContent class="pt-6 pb-6">
					<Sprout
						class="size-8 text-primary transition-transform duration-500 group-hover:-translate-y-0.5"
					/>
					<h3 class="mt-4 text-xl font-semibold">{farm.name}</h3>
					{#if farm.location}
						<p class="text-sm font-medium text-primary">{farm.location}</p>
					{/if}
					{#if showStats && farm.stats?.length}
						<ul class="mt-4 space-y-1">
							{#each farm.stats as stat (stat)}
								<li class="text-sm text-muted-foreground">{stat}</li>
							{/each}
						</ul>
					{/if}
					<p class="mt-3 text-sm text-muted-foreground">{farm.description}</p>
				</CardContent>
			</Card>
		</div>
	{/each}
</div>
