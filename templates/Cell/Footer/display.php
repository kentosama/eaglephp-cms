<footer>
    <div class="container">
        <div class="footer-content">
            <div class="site-footer">
                <p>Powered by EaglePHP + ❤️ for Sega</p>
                <p>Page généréee en <?= $this->request->getExecutionTime() ?> ms</p>
                <p>Dernière mise à jour du site : <?= $last_modified->format('d F Y, H:i') ?></p>

                <p>&copy; 2025 Kentosama — {{ .Site.Title }} </p>
                <p><a href="/about/">À propos</a> | <a href="/contact/">Contact</a> | <a href="/mentions-legales/">Mentions légales</a></p>
            </div>
        </div>
    </div>
</footer>

